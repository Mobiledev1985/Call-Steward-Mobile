import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/model/employee/employee_detail_model.dart';
import 'package:call_steward/model/vacation/vacation.dart';
import 'package:call_steward/model/vacation/vacation_history_model.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/screens/vacation/widgets/vacation_conflict_dialog.dart';
import 'package:call_steward/utils/utilities.dart';

class VacationController extends GetxController implements ApiCallBacks {
  final RxBool _isLoading = RxBool(false);

  /// [isLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get isLoading => _isLoading.value;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  final RxBool _initLoading = RxBool(false);

  /// [initLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get initLoading => _initLoading.value;
  set initLoading(bool initLoading) => _initLoading.value = initLoading;

  final RxBool _isLoadingEditVacation = RxBool(false);

  /// [isLoadingEditVacation] is bool value, it return true when API call start and when it finished it will return false
  bool get isLoadingEditVacation => _isLoadingEditVacation.value;
  set isLoadingEditVacation(bool isLoadingEditVacation) =>
      _isLoadingEditVacation.value = isLoadingEditVacation;

  final TextEditingController labelController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final GlobalKey<FormState> formForAddDialog = GlobalKey<FormState>();

  final Rx<EmployeeDetailModel> _employeeDetailModel =
      EmployeeDetailModel().obs;

  EmployeeDetailModel get employeeDetailModel => _employeeDetailModel.value;
  set employeeDetailModel(EmployeeDetailModel isLoading) =>
      _employeeDetailModel.value = employeeDetailModel;

  final Rx<GetEmployeevacations> _vacationModel = GetEmployeevacations().obs;

  GetEmployeevacations get vacationModel => _vacationModel.value;
  set vacationModel(GetEmployeevacations vacationModel) =>
      _vacationModel.value = vacationModel;

  final RxList<VacationHistoryModel> _vacationHistory =
      RxList<VacationHistoryModel>();

  List<VacationHistoryModel> get vacationHistory => _vacationHistory;
  set vacationHistory(List<VacationHistoryModel> vacationHistory) =>
      _vacationHistory.value = vacationHistory;

  @override
  void onInit() {
    super.onInit();
    getEmployeesDetailsById();
  }

  /// Call Get Employees Details by id
  void getEmployeesDetailsById() async {
    initLoading = true;
    await ApiPresenter(this).getEmployeesDetailsById(
      AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    );
  }

  void addVacation(BuildContext context, bool isFromDialog) {
    if (isFromDialog) {
      if (formForAddDialog.currentState!.validate()) {
        final Map<String, String> startAndEnd = getStartAndEndValue(context);
        ApiPresenter(this).addEmployeeVacation(
          employeeDetailModel.result!.employableId,
          labelController.text.trim(),
          startAndEnd['start']!,
          startAndEnd['end']!,
        );
      }
    } else {
      if (form.currentState!.validate()) {
        final Map<String, String> startAndEnd = getStartAndEndValue(context);
        ApiPresenter(this).addEmployeeVacation(
          employeeDetailModel.result!.employableId,
          labelController.text.trim(),
          startAndEnd['start']!,
          startAndEnd['end']!,
        );
      }
    }
  }

  void deleteVacation(String vacationId) async {
    await ApiPresenter(this).deleteEmployeeVacation(
        vacationId, employeeDetailModel.result!.employableId);
    Get.back();
  }

  Map<String, String> getStartAndEndValue(BuildContext context) {
    late String start, end;

    final dateFormat =
        Utilities.getDateFormat(employeeDetailModel.result!.dateFormat ?? "");
    final convertedStartDate = DateFormat('y-MM-d')
        .format(DateFormat(dateFormat).parse(startDateController.text));
    final convertedEndDate = DateFormat('y-MM-d')
        .format(DateFormat(dateFormat).parse(endDateController.text));
    if (Utilities.is24HourFormat(employeeDetailModel.result!.timeFormat!)) {
      start = "$convertedStartDate ${startTimeController.text}";
      end = "$convertedEndDate ${endTimeController.text}";
    } else {
      final MaterialLocalizations localizations =
          MaterialLocalizations.of(context);

      String convertedStartTime = localizations.formatTimeOfDay(
        Utilities.stringToTimeOfDay(startTimeController.text),
        alwaysUse24HourFormat: true,
      );
      String convertedEndTime = localizations.formatTimeOfDay(
        Utilities.stringToTimeOfDay(endTimeController.text),
        alwaysUse24HourFormat: true,
      );

      start = "$convertedStartDate $convertedStartTime";
      end = "$convertedEndDate $convertedEndTime";
    }

    return {
      "start": start,
      "end": end,
    };
  }

  void editVacation(BuildContext context, String vacationId) async {
    final Map<String, String> startAndEnd = getStartAndEndValue(context);
    isLoadingEditVacation = true;
    await ApiPresenter(this).editEmployeeVacation(
      employeeDetailModel.result!.employableId,
      labelController.text.trim(),
      startAndEnd['start']!,
      startAndEnd['end']!,
      vacationId,
    );
    isLoadingEditVacation = false;
  }

  @override
  void onConnectionError(String error, String apiEndPoint) {
    Utilities.showErrorMessage(error);
  }

  @override
  void onError(String errorMsg, String apiEndPoint) {
    initLoading = false;
    Utilities.showErrorMessage(errorMsg);
  }

  @override
  void onLoading(bool isLoading, String apiEndPoint) {
    this.isLoading = isLoading;
  }

  @override
  Future<void> onSuccess(object, String strMsg, String apiEndPoint) async {
    if (object['status_message'] == "Vacation confict") {
      Get.dialog(const VacationConflictDialog());
    } else if (apiEndPoint.contains(ApiEndPoints.employee)) {
      _employeeDetailModel.value = EmployeeDetailModel.fromJson(object);

      /// Get employee vacations and Get vacations history
      await Future.wait([
        ApiPresenter(this).getEmployeeVacations(
            _employeeDetailModel.value.result!.employableId),
        ApiPresenter(this).getEmployeeVacationsHistory(
            _employeeDetailModel.value.result!.employableId)
      ]);
      initLoading = false;
    } else if (apiEndPoint == ApiEndPoints.getEmployeevacations) {
      _vacationModel.value = GetEmployeevacations.fromJson(object);
    } else if (apiEndPoint == ApiEndPoints.getEmployeeVacationHistory) {
      _vacationHistory.clear();
      _vacationHistory.value = (object['result'] as List)
          .map((e) => VacationHistoryModel.fromJson(e))
          .toList();
    } else {
      clearTextField();
      Get.back();
      initLoading = true;
      await ApiPresenter(this).getEmployeeVacations(
          _employeeDetailModel.value.result!.employableId);
      initLoading = false;
    }
  }

  void clearTextField() {
    startDateController.clear();
    startTimeController.clear();
    endDateController.clear();
    endTimeController.clear();
    labelController.clear();
  }
}
