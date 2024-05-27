import 'dart:collection';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/model/calendar/calendar_job_model.dart';
import 'package:call_steward/model/calendar/job_detail_model.dart';
import 'package:call_steward/model/calendar/wishlist_status_model.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/widgets/full_screen_loading_dialog.dart';

class CalendarController extends GetxController implements ApiCallBacks {
  final RxBool _isLoading = RxBool(false);

  /// [isLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get isLoading => _isLoading.value;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  final RxBool _jobDetailIsLoading = RxBool(false);

  /// [jobDetailIsLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get jobDetailIsLoading => _jobDetailIsLoading.value;
  set jobDetailIsLoading(bool jobDetailIsLoading) =>
      _jobDetailIsLoading.value = jobDetailIsLoading;

  final Rx<DateTime> _selectedDate = Rx(DateTime.now());

  /// [selectedDate] selected date which use in get Calendar jobs.
  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(DateTime date) => _selectedDate.value = date;

  final Rx<DateTime> _focusDate = Rx(DateTime.now());

  DateTime get focusDate => _focusDate.value;
  set focusDate(DateTime date) => _focusDate.value = date;

  final Rx<LinkedHashMap<DateTime, List<CalendarJobModel>>> _allDatewiseJobs =
      Rx<LinkedHashMap<DateTime, List<CalendarJobModel>>>(
    LinkedHashMap<DateTime, List<CalendarJobModel>>(),
  );
  LinkedHashMap<DateTime, List<CalendarJobModel>> get allDatewiseJobs =>
      _allDatewiseJobs.value;
  set allDatewiseJobs(
          LinkedHashMap<DateTime, List<CalendarJobModel>> allDatewiseJobs) =>
      _allDatewiseJobs.value = allDatewiseJobs;

  final RxList<CalendarJobModel> _selectedDayJobs = RxList();

  List<CalendarJobModel> get selectedDayJobs => _selectedDayJobs;
  set selectedDayJobs(List<CalendarJobModel> selectedDayJobs) =>
      _selectedDayJobs.value = selectedDayJobs;

  final Rx<WishlistStatusModel> _wishStatusModel = Rx(WishlistStatusModel());
  WishlistStatusModel get wishStatusModel => _wishStatusModel.value;
  set wishStatusModel(WishlistStatusModel wishStatusModel) =>
      _wishStatusModel.value = wishStatusModel;

  final Rx<JobDetailModel> _jobDetailsModel = Rx(JobDetailModel());
  JobDetailModel get jobDetailsModel => _jobDetailsModel.value;
  set jobDetailsModel(JobDetailModel jobDetailsModel) =>
      _jobDetailsModel.value = jobDetailsModel;

  final Rx<CalendarFormat> _calendarFormat = Rx(CalendarFormat.month);
  CalendarFormat get calendarFormat => _calendarFormat.value;
  set calendarFormat(CalendarFormat calendarFormat) =>
      _calendarFormat.value = calendarFormat;

  Future<void> getCalendarJobs() async {
    ApiPresenter(this).getCalendarJobs(
        selectedDate.month.toString(), selectedDate.year.toString());
    Get.find<HomeControlller>().getClientAndEmployeesDetailsById();
  }

  Future<void> getWishlistStatusAndJobDetails(String jobId) async {
    jobDetailIsLoading = true;
    await ApiPresenter(this).getWishlistStatus(jobId);
    await ApiPresenter(this).getJobDetails(jobId);
    jobDetailIsLoading = false;
  }

  Future<void> onRadioButtonPress(
      String? wishlistId, String jobId, bool isWishlist) async {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FullScreenLoadingDialog(),
    );
    if (wishlistId == null) {
      await ApiPresenter(this).wishlistAndIgnoreList(jobId, isWishlist);
    } else {
      await ApiPresenter(this).changeWishlistStatus(wishlistId);
    }
    Get.back();
  }

  @override
  void onConnectionError(String error, String apiEndPoint) {
    Utilities.showErrorMessage(error);
  }

  @override
  void onError(String errorMsg, String apiEndPoint) {
    Utilities.showErrorMessage(errorMsg);
  }

  @override
  void onLoading(bool isLoading, String apiEndPoint) {
    if (apiEndPoint.contains(ApiEndPoints.calendarJobs)) {
      this.isLoading = isLoading;
    }
  }

  @override
  void onSuccess(object, String strMsg, String apiEndPoint) async {
    if (apiEndPoint == ApiEndPoints.getWishlistStatus) {
      wishStatusModel = WishlistStatusModel.fromJson(object);
    } else if (apiEndPoint == ApiEndPoints.calendarJobs) {
      handleCalendarJobsResponse(object);
    } else if (apiEndPoint.contains(ApiEndPoints.changeWishlistStatus)) {
      final bool isWished = object['result']['list_type'] == "W";
      if (isWished) {
        wishStatusModel.result?.listType?.value = "I";
      } else {
        wishStatusModel.result?.listType?.value = "W";
      }
    } else if (apiEndPoint.contains(ApiEndPoints.wishlist) ||
        apiEndPoint.contains(ApiEndPoints.ignorelist)) {
      wishStatusModel = WishlistStatusModel.fromJson(object);
    } else {
      jobDetailsModel = JobDetailModel.fromJson(object['result']);
    }
  }

  void handleCalendarJobsResponse(object) {
    allDatewiseJobs.clear();
    List<CalendarJobModel> calendarJobs = (object['result'] as List)
        .map((e) => CalendarJobModel.fromJson(e))
        .toList();

    // Loop through each job in the calendarJobs list
    for (CalendarJobModel job in calendarJobs) {
      // Convert the job start and end dates to DateTime objects
      DateTime startDate = DateTime.parse(job.start!);
      DateTime endDate = DateTime.parse(job.end!);

      // Loop through each day between the start and end dates (inclusive)
      for (DateTime date = startDate;
          date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
          date = date.add(const Duration(days: 1))) {
        // Check if the date is in the current month
        if (date.month == selectedDate.month) {
          // Check if the date already exists in the LinkedHashMap
          if (allDatewiseJobs.containsKey(date)) {
            // If it does, add the current job to the list of jobs for that date
            allDatewiseJobs[date]!.add(job);
          } else {
            // If it doesn't, create a new list with the current job and add it to the LinkedHashMap with the date as the key
            allDatewiseJobs[date] = [job];
          }
        }
      }
    }
    if (selectedDate.month == DateTime.now().month) {
      selectedDate = focusDate = DateTime.now();
    }
    selectedDayJobs = getJobsForDay(selectedDate);
  }

  /// Get the jobs by the date.
  List<CalendarJobModel> getJobsForDay(DateTime day) {
    List<CalendarJobModel>? filteredList = [];
    allDatewiseJobs.forEach(
      (key, value) {
        if (key.day == day.day && key.month == day.month) {
          filteredList.addAll(value);
        }
      },
    );
    return filteredList;
  }

  /// Use to change selected date ,focus date and change the jobs by the date .
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(selectedDate, selectedDay)) {
      selectedDate = selectedDay;
      focusDate = focusedDay;
      selectedDayJobs = getJobsForDay(selectedDay);
    }
  }
}
