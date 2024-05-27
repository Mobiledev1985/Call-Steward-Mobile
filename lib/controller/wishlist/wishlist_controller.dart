import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/model/employee/employee_detail_model.dart';
import 'package:call_steward/model/schedule/job_call_model.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import 'package:call_steward/widgets/full_screen_loading_dialog.dart';

class WishlistController extends GetxController implements ApiCallBacks {
  final RxBool _isLoading = RxBool(false);

  /// [isLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get isLoading => _isLoading.value;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  final RxBool _employeeDetailsIsLoading = RxBool(true);

  /// [employeeDetailsIsLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get employeeDetailsIsLoading => _employeeDetailsIsLoading.value;
  set employeeDetailsIsLoading(bool employeeDetailsIsLoading) =>
      _employeeDetailsIsLoading.value = isLoading;

  final RxInt _selectedTabIndex = RxInt(1);

  /// [selectedTabIndex] selected tab index.
  int get selectedTabIndex => _selectedTabIndex.value;
  set selectedTabIndex(int selectedTabIndex) =>
      _selectedTabIndex.value = selectedTabIndex;

  final RxList<Job> _scheduledJobList = RxList();

  List<Job> get scheduledJobList => _scheduledJobList;
  set scheduledJobList(List<Job> sheduledJobList) =>
      _scheduledJobList.value = sheduledJobList;

  final RxList<JobCallModel> _wishedList = RxList();

  List<JobCallModel> get wishedList => _wishedList;
  set wishedList(List<JobCallModel> wishedList) =>
      _wishedList.value = wishedList;

  final RxList<JobCallModel> _ignoredJobList = RxList();

  List<JobCallModel> get ignoredJobList => _ignoredJobList;
  set ignoredJobList(List<JobCallModel> ignoredJobList) =>
      _ignoredJobList.value = ignoredJobList;

  final Rx<EmployeeDetailModel> _employeeDetailModel =
      EmployeeDetailModel().obs;

  EmployeeDetailModel get employeeDetailModel => _employeeDetailModel.value;
  set employeeDetailModel(EmployeeDetailModel isLoading) =>
      _employeeDetailModel.value = employeeDetailModel;

  final RxBool _dailyStandBy = RxBool(false);

  bool get dailyStandBy => _dailyStandBy.value;
  set dailyStandBy(bool dailyStandBy) => _dailyStandBy.value = dailyStandBy;

  /// Use to store  temp [wishedJobId] for delete wished Job.
  String wishedJobId = '';

  /// Use to store  temp [ignoredJobId] id for delete wished Job.
  String ignoredJobId = '';

  /// Use to store  temp [scheduledJobId] id for drag Job.
  String scheduledJobId = '';

  final TextEditingController notesForDispatcherController =
      TextEditingController();

  void getInitialData() async {
    _employeeDetailsIsLoading.value = true;
    await Get.find<HomeControlller>().getClientAndEmployeesDetailsById();
    await getEmployeesDetailsById();
    await getAndDeleteWishlistJobs();
    _employeeDetailsIsLoading.value = false;
  }

  /// Call Get Employees Details by id
  Future<void> getEmployeesDetailsById() async {
    await ApiPresenter(this).getEmployeesDetailsById(
      AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    );
  }

  Future<void> getAndDeleteWishlistJobs([String wishedJobId = ""]) async {
    this.wishedJobId = wishedJobId;
    await ApiPresenter(this).getAndDeleteWishlistJobs(wishedJobId);
  }

  Future<void> getScheduledJobs() async {
    ApiPresenter(this).getSheduledJobs();
  }

  Future<void> getAndDeleteIgnoredJobs([String ignoredJobId = ""]) async {
    this.ignoredJobId = ignoredJobId;
    ApiPresenter(this).getAndDeleteIgnorelistJobs(ignoredJobId);
  }

  Future<void> updateMyAvailibility(int switchStatus) async {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FullScreenLoadingDialog(),
    );
    await ApiPresenter(this).updateMyAvailibility(switchStatus);
    Get.back();
  }

  Future<void> onDropScheduleJobToWishedJob(String jobId) async {
    scheduledJobId = jobId;

    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FullScreenLoadingDialog(),
    );

    final encodedJobId = "[\"${[jobId].join("\",\"")}\"]";
    await ApiPresenter(this)
        .wishlistmobile(notesForDispatcherController.text.trim(), encodedJobId);
    notesForDispatcherController.clear();
    Get.back();
  }

  Future<void> onDropScheduleJobToIgnoredJob(String jobId) async {
    scheduledJobId = jobId;
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FullScreenLoadingDialog(),
    );

    final encodedJobId = "[\"${[jobId].join("\",\"")}\"]";
    await ApiPresenter(this).ignorelistmobile(
        notesForDispatcherController.text.trim(), encodedJobId);
    notesForDispatcherController.clear();
    Get.back();
  }

  void resetIds() {
    wishedJobId = "";
    ignoredJobId = "";
    scheduledJobId = "";
  }

  @override
  void onConnectionError(String error, String apiEndPoint) {
    resetIds();
  }

  @override
  void onError(String errorMsg, String apiEndPoint) {
    resetIds();
  }

  @override
  void onLoading(bool isLoading, String apiEndPoint) {
    if (ApiEndPoints.updateMyAvailibility != apiEndPoint &&
        !apiEndPoint.contains(ApiEndPoints.wishlistmobile) &&
        !apiEndPoint.contains(ApiEndPoints.ignorelistmobile)) {
      this.isLoading = isLoading;
    }
  }

  @override
  void onSuccess(object, String strMsg, String apiEndPoint) async {
    if (apiEndPoint.contains(ApiEndPoints.wishlistmobile) ||
        apiEndPoint.contains(ApiEndPoints.ignorelistmobile)) {
      _scheduledJobList.removeWhere((element) => element.id == scheduledJobId);
      scheduledJobId = "";
    } else if (apiEndPoint.contains(ApiEndPoints.wishlist)) {
      if (wishedJobId.isNotEmpty) {
        wishedList.removeWhere((element) => element.id == wishedJobId);
        wishedJobId = "";
      } else {
        _wishedList.value = (object['result'] as List)
            .map((e) => JobCallModel.fromJson(e))
            .toList();
      }
    } else if (ApiEndPoints.employeeJobNotInWishlist == apiEndPoint) {
      _scheduledJobList.value =
          (object['result'] as List).map((e) => Job.fromJson(e)).toList();
    } else if (apiEndPoint.contains(ApiEndPoints.ignorelist)) {
      if (ignoredJobId.isNotEmpty) {
        ignoredJobList.removeWhere((element) => element.id == ignoredJobId);
        ignoredJobId = "";
      } else {
        _ignoredJobList.value = (object['result'] as List)
            .map((e) => JobCallModel.fromJson(e))
            .toList();
      }
    } else if (ApiEndPoints.updateMyAvailibility == apiEndPoint) {
      dailyStandBy = !dailyStandBy;
    } else {
      _employeeDetailModel.value = EmployeeDetailModel.fromJson(object);
      if (employeeDetailModel.result != null &&
          employeeDetailModel.result != null &&
          employeeDetailModel.result!.employeeAvailability!.any((element) =>
              element.employeeId ==
              AppPreferences().sharedPrefRead(StorageKeys.employeeId))) {
        dailyStandBy = true;
      }
    }
  }
}
