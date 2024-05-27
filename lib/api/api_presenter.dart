import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/api/rest_client.dart';
import 'package:call_steward/api/web_fields.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import 'package:call_steward/utils/hearders/api_headers.dart';
import 'package:call_steward/utils/hearders/api_hearders_keys.dart';

class ApiPresenter {
  final ApiCallBacks _apiCallBacks;

  ///Almost all are same & to be declared as per the parameters in PostMan and EndPoints in PostMan
  ApiPresenter(this._apiCallBacks);

  ///Login API
  Future<void> login(
    String email,
    String password,
    String url,
    String language,
    String deviceToken,
  ) async {
    Map requestParam = toLoginJson(
      email,
      password,
      url,
      language,
      deviceToken,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.login,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  ///Login API body
  Map<String, dynamic> toLoginJson(
    String email,
    String password,
    String url,
    String language,
    String deviceToken,
  ) =>
      {
        WebFields.email: email,
        WebFields.password: password,
        WebFields.url: url,
        WebFields.language: language,
        WebFields.deviceToken: deviceToken
      };

  ///Sign in with Google API
  Future<void> socialLogin(
    String url,
    String idToken,
    // String appSource,
    String deviceToken,
    String language,
    bool isGoogleLogin,
  ) async {
    Map requestParam = toSignInWithGoogleJson(
      url,
      idToken,
      // appSource,
      deviceToken,
      language,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint:
          isGoogleLogin ? ApiEndPoints.socialLogin : ApiEndPoints.appleLogin,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  ///Logout API
  Future<void> logout() async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.logout,
      requestType: RequestType.post,
      needAuthorazation: true,
    );
  }

  //Login API body
  Map<String, dynamic> toSignInWithGoogleJson(
    String url,
    String idToken,
    // String appSource,
    String deviceToken,
    String language,
  ) =>
      {
        WebFields.url: url,
        WebFields.idToken: idToken,
        // WebFields.appSource: appSource,
        WebFields.deviceToken: deviceToken,
        WebFields.language: language,
      };

  ///Forgot Password API
  Future<void> forgotPassword(String email, String redirectLink) async {
    Map requestParam = toForgotPasswordJson(
      email,
      redirectLink,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.forgotPassword,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  //Forgot Password With SMS CodeAPI
  Future<void> forgotPasswordWithSMSCode(
      String email, String redirectLink) async {
    Map requestParam = toForgotPasswordJson(
      email,
      redirectLink,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.forgotPasswordWithSMSCode,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  //Forgot Password API body
  Map<String, dynamic> toForgotPasswordJson(
    String email,
    String redirectLink,
  ) =>
      {
        WebFields.email: email,
        WebFields.redirectLink: redirectLink,
      };

  // Verify Otp API
  Future<void> verifyOtp(String email, String redirectLink, String otp) async {
    Map requestParam = toVerifyOtpJson(
      email,
      redirectLink,
      otp,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.verifyOtp,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  //Verify otp API body
  Map<String, dynamic> toVerifyOtpJson(
    String email,
    String redirectLink,
    String otp,
  ) =>
      {
        WebFields.email: email,
        WebFields.url: redirectLink,
        WebFields.code: otp
      };

  // Update password API
  Future<void> updatePassword(String email, String password, String otp) async {
    Map requestParam = toUpdatePasswordJson(
      email,
      password,
      otp,
    );
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.resetPassword,
      requestType: RequestType.post,
      needAuthorazation: false,
    );
  }

  //Verify otp API body
  Map<String, dynamic> toUpdatePasswordJson(
    String email,
    String password,
    String otp,
  ) =>
      {
        WebFields.email: email,
        WebFields.password: password,
        WebFields.code: otp
      };

  ///Get Employees Association API
  Future<void> getEmployeesAssociation(String userId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint:
          "${ApiEndPoints.employee}$userId${ApiEndPoints.getEmployeesAssociation}",
    );
  }

  ///Get MUA Employees  API
  Future<void> getMUAEmployees(
      String clientId, String employeeId, String userId) async {
    Map<String, String> headers = {
      ApiHeadersKey.clientId: clientId,
      ApiHeadersKey.employeeId: employeeId,
      "userid": userId,
    };
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.employee}${ApiEndPoints.getMUAEmployees}",
      extraHeader: headers,
    );
  }

  ///Get Employees Details by id API
  Future<void> getEmployeesDetailsById(String employeeId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.employee}$employeeId",
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
      isLoading: false,
    );
  }

  ///Call ckeck skill api
  Future<void> checkSkill(String employeeId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint:
          "${ApiEndPoints.employee}$employeeId${ApiEndPoints.checkSkill}",
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  ///get Client detials by id
  Future<void> getClientDetailBytId({String? clientId}) async {
    String apiEndPoint = ApiEndPoints.client;
    if (clientId == null) {
      apiEndPoint = apiEndPoint +
          AppPreferences().sharedPrefRead(StorageKeys.contextClientId);
    } else {
      apiEndPoint = apiEndPoint + clientId;
    }
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: apiEndPoint,
    );
  }

  ///Get all skills API
  Future<void> getAllSkill() async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.getSkills,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  ///upload Profile image API
  Future<void> uploadProfileImage(
      String fileName, String mimeType, String base64Image) async {
    Map requestParam =
        toUploadProfileImageJson(fileName, mimeType, base64Image);
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.attachmentSigleFile,
      requestType: RequestType.post,
      requestParam: requestParam,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // upload Profile image API body
  Map<String, dynamic> toUploadProfileImageJson(
          String fileName, String mimeType, String base64Image) =>
      {
        WebFields.fileName: fileName,
        WebFields.imageFile: mimeType + base64Image,
      };

  ///edit Profile image API
  Future<void> editProfile(requestParam, String employeeId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.employee}$employeeId",
      requestType: RequestType.put,
      requestParam: requestParam,
      needToJsonDecode: false,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  //  Get Employee vacations  API
  Future<void> getEmployeeVacations(String employeeId) async {
    Map requestParam = toGetEmployeeVacationsJson(employeeId);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.getEmployeevacations,
      requestType: RequestType.post,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
      isLoading: false,
    );
  }

  // Get Employee vacations API body
  Map<String, dynamic> toGetEmployeeVacationsJson(
    String employeeId,
  ) =>
      {
        WebFields.vacationableIid: employeeId,
      };

  //  Get Employee vacations  API
  Future<void> getEmployeeVacationsHistory(String employeeId) async {
    Map requestParam = toGetEmployeeVacationsHistoryJson(employeeId);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.getEmployeeVacationHistory,
      requestType: RequestType.post,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
      isLoading: false,
    );
  }

  // Get Employee vacations API body
  Map<String, dynamic> toGetEmployeeVacationsHistoryJson(
    String employeeId,
  ) =>
      {
        WebFields.vacationableIid: employeeId,
      };

  //  Add Employee vacations  API
  Future<void> addEmployeeVacation(
    String employeeId,
    String label,
    String start,
    String end,
  ) async {
    Map requestParam = toAddEmployeeVacationJson(employeeId, label, start, end);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.vacation,
      requestType: RequestType.post,
      extraHeader:
          ApiHeaders.getContextClientIdAndContextRoleIDAndAffectorHeaders(
              employeeId),
    );
  }

  // add Employee vacation API body
  Map<String, dynamic> toAddEmployeeVacationJson(
    String employeeId,
    String lable,
    String start,
    String end,
  ) =>
      {
        WebFields.end: end,
        WebFields.label: lable,
        WebFields.start: start,
        WebFields.vacationableIid: employeeId,
      };

  //  Delete Employee vacations  API
  Future<void> deleteEmployeeVacation(
      String vacationId, String employeeId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.vacation}/$vacationId",
      requestType: RequestType.delete,
      extraHeader:
          ApiHeaders.getContextClientIdAndContextRoleIDAndAffectorHeaders(
              employeeId),
    );
  }

  //  Edit Employee vacations  API
  Future<void> editEmployeeVacation(
    String employeeId,
    String label,
    String start,
    String end,
    String vacationId,
  ) async {
    Map requestParam = toEditEmployeeVacationJson(label, start, end);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: "${ApiEndPoints.vacation}/$vacationId",
      requestType: RequestType.put,
      extraHeader:
          ApiHeaders.getContextClientIdAndContextRoleIDAndAffectorHeaders(
              employeeId),
    );
  }

  // Edit Employee vacation API body
  Map<String, dynamic> toEditEmployeeVacationJson(
    String lable,
    String start,
    String end,
  ) =>
      {
        WebFields.end: end,
        WebFields.label: lable,
        WebFields.start: start,
      };

  ///Get Notify Log API
  Future<void> getNotifyLog([int page = 0]) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.notifyLog,
      queryParams: page != 0 ? "?page=$page" : "",
      extraHeader: ApiHeaders.getContextClientIdAndEmployeeIdHeaders(),
    );
  }

  ///Get Notify Log API
  Future<void> getActionLog([int page = 0]) async {
    Map<String, String> headers = {
      "Job-d": "",
      'Employee-Id': AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.actionLog,
      queryParams: page != 0 ? "?page=$page" : "",
      extraHeader: headers,
    );
  }

  ///Check User Subscription Status API
  Future<void> checkUserSubscriptionStatus() async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint:
          "${ApiEndPoints.employee}${AppPreferences().sharedPrefRead(StorageKeys.userId)}${ApiEndPoints.checkUserSubscriptionStatus}",
      needToJsonDecode: false,
    );
  }

  //  Change date and time format API
  Future<void> changeDateFormat(
    String formatString,
    String type,
  ) async {
    Map requestParam = toChangeDateFormatJson(formatString, type);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.changeDateFormat,
      requestType: RequestType.post,
      extraHeader: {
        ApiHeadersKey.clientId:
            AppPreferences().sharedPrefRead(StorageKeys.contextClientId)
      },
    );
  }

  // Change date and time format API body
  Map<String, dynamic> toChangeDateFormatJson(
    String formatString,
    String type,
  ) =>
      {
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.formatString: formatString,
        WebFields.type: type,
      };

  //  App Notification Settings API
  Future<void> appNotificationSettings(
    int status,
  ) async {
    Map requestParam = toAppNotificationSettingsJson(status);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.appNotificationSettings,
      requestType: RequestType.post,
      extraHeader: {
        "ClientId": AppPreferences().sharedPrefRead(StorageKeys.contextClientId)
      },
    );
  }

  // App Notification Settings API body
  Map<String, dynamic> toAppNotificationSettingsJson(
    int status,
  ) =>
      {
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.status: status,
      };

  //  Email Notification Settings API
  Future<void> emailNotificationSettings(
    int status,
  ) async {
    Map requestParam = toEmailNotificationSettingsJson(status);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.emailNotificationSettings,
      requestType: RequestType.post,
      extraHeader: {
        ApiHeadersKey.clientId:
            AppPreferences().sharedPrefRead(StorageKeys.contextClientId)
      },
    );
  }

  // Email Notification Settings API body
  Map<String, dynamic> toEmailNotificationSettingsJson(
    int status,
  ) =>
      {
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.status: status,
      };

  //  SMS Notification Settings API
  Future<void> smsNotificationSettings(
    int status,
  ) async {
    Map requestParam = toSMSlNotificationSettingsJson(status);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.smsNotificationSettings,
      requestType: RequestType.post,
      extraHeader: {
        ApiHeadersKey.clientId:
            AppPreferences().sharedPrefRead(StorageKeys.contextClientId)
      },
    );
  }

  // SMS Notification Settings API body
  Map<String, dynamic> toSMSlNotificationSettingsJson(
    int status,
  ) =>
      {
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.status: status,
      };

  //  Stop Notification Settings API
  Future<void> stopNotificationSettings(
    int status,
  ) async {
    Map requestParam = toStoplNotificationSettingsJson(status);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.stopNotificationSettings,
      requestType: RequestType.post,
      extraHeader: {
        ApiHeadersKey.clientId:
            AppPreferences().sharedPrefRead(StorageKeys.contextClientId)
      },
    );
  }

  // Stop Notification Settings API body
  Map<String, dynamic> toStoplNotificationSettingsJson(
    int status,
  ) =>
      {
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.status: status,
      };

  // Update Mailing List API
  Future<void> updateMailingList(
    String mailingAction,
  ) async {
    Map requestParam = toUpdateMailingListJson(mailingAction);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint:
          "${ApiEndPoints.employee}${AppPreferences().sharedPrefRead(StorageKeys.userId)}${ApiEndPoints.updateMailingList}",
      requestType: RequestType.put,
      needToJsonDecode: false,
    );
  }

  // Update Mailing List API body
  Map<String, dynamic> toUpdateMailingListJson(
    String mailingAction,
  ) =>
      {
        WebFields.mailingAction: mailingAction,
      };

  // Employee Calls By Next 45 Days API
  Future<void> employeeCallsByNext45Days() async {
    Map<String, String> headers = {
      ApiHeadersKey.userId: AppPreferences().sharedPrefRead(StorageKeys.userId),
      ApiHeadersKey.flag: "mua",
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.employeeCallsByNext45Days,
      extraHeader: headers,
    );
  }

  // Employee Calls By Next 45 Days API
  Future<void> employeeDeclinedCallsByNext45() async {
    Map<String, String> headers = {
      ApiHeadersKey.userId: AppPreferences().sharedPrefRead(StorageKeys.userId),
      ApiHeadersKey.flag: "mua",
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.employeeDeclinedCallsByNext45,
      extraHeader: headers,
    );
  }

  // Employee Calls By Month API
  Future<void> employeeCallsByMonth(String month, String year) async {
    Map<String, String> headers = {
      ApiHeadersKey.month: month,
      ApiHeadersKey.year: year,
      ApiHeadersKey.userId: AppPreferences().sharedPrefRead(StorageKeys.userId),
      ApiHeadersKey.flag: "mua",
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.employeeCallsByMonth,
      extraHeader: headers,
    );
  }

  // Employee Declined Calls By Month API
  Future<void> employeeDeclinedCallsByMonth(String month, String year) async {
    Map<String, String> headers = {
      ApiHeadersKey.month: month,
      ApiHeadersKey.year: year,
      ApiHeadersKey.userId: AppPreferences().sharedPrefRead(StorageKeys.userId),
      ApiHeadersKey.flag: "mua",
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.employeeDeclinedCallsByMonth,
      extraHeader: headers,
    );
  }

  // Confrim Employee Call API
  Future<void> confirmEmployeeCall(
    String userId,
    String loggedInEmployeeId,
    String page,
    String callId,
  ) async {
    Map requestParam = toEmployeeCallJson(userId, loggedInEmployeeId, page);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: "${ApiEndPoints.call}/$callId${ApiEndPoints.confirm}",
      requestType: RequestType.put,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Pass Employee Call API
  Future<void> passEmployeeCall(
    String userId,
    String loggedInEmployeeId,
    String page,
    String callId,
  ) async {
    Map requestParam = toEmployeeCallJson(userId, loggedInEmployeeId, page);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: "${ApiEndPoints.call}/$callId${ApiEndPoints.pass}",
      requestType: RequestType.put,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Pass Employee Call API
  Future<void> declineEmployeeCall(
    String userId,
    String loggedInEmployeeId,
    String page,
    String callId,
  ) async {
    Map requestParam = toEmployeeCallJson(userId, loggedInEmployeeId, page);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: "${ApiEndPoints.call}/$callId${ApiEndPoints.decline}",
      requestType: RequestType.put,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Confrim Employee Call body
  Map<String, dynamic> toEmployeeCallJson(
    String userId,
    String loggedInEmployeeId,
    String page,
  ) =>
      {
        WebFields.userId: userId,
        WebFields.loggedInEmployeeId: loggedInEmployeeId,
        WebFields.page: page,
      };

  //  Get Job Calls API
  Future<void> getJobCalls(
    String callId,
    String createdAt,
  ) async {
    Map<String, String> headers = {
      ApiHeadersKey.nextDate: createdAt,
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.job}$callId/${ApiEndPoints.call}",
      extraHeader: headers,
    );
  }

  // Get Calendar jobs API
  Future<void> getCalendarJobs(String month, String year) async {
    Map<String, String> headers = {
      ApiHeadersKey.month: month,
      ApiHeadersKey.year: year,
      'employee-id': AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.calendarJobs,
      extraHeader: headers,
    );
  }

  // Get Wishlist Status API
  Future<void> getWishlistStatus(
    String jobId,
  ) async {
    Map requestParam = toGetWishlistStatusJson(jobId);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.getWishlistStatus,
      requestType: RequestType.post,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Confrim Employee Call body
  Map<String, dynamic> toGetWishlistStatusJson(
    String jobId,
  ) =>
      {
        WebFields.jobId: jobId,
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
      };

  // Get Calendar jobs API
  Future<void> getJobDetails(String jobId) async {
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: "${ApiEndPoints.job}$jobId",
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  //  Wishlist Status API
  Future<void> wishlistAndIgnoreList(String jobId, bool isWishlist) async {
    final Map<String, String> extraHeaders = {
      WebFields.jobid: jobId,
    };
    extraHeaders.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    final String endPoint =
        "${ApiEndPoints.employee}${AppPreferences().sharedPrefRead(StorageKeys.employeeId)}";

    await RestClient(_apiCallBacks).apiCall(
      requestParam: {
        WebFields.jobId: jobId,
      },
      apiEndPoint: isWishlist
          ? "$endPoint${ApiEndPoints.wishlist}"
          : "$endPoint${ApiEndPoints.ignorelist}",
      requestType: RequestType.post,
      extraHeader: extraHeaders,
    );
  }

  // Change Wishlist Status API
  Future<void> changeWishlistStatus(String wishlistId) async {
    await RestClient(_apiCallBacks).apiCall(
      requestParam: {
        WebFields.wishlistId: wishlistId,
      },
      apiEndPoint: ApiEndPoints.changeWishlistStatus,
      requestType: RequestType.post,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Get And Delete Wishlist jobs API
  Future<void> getAndDeleteWishlistJobs([String wishedJobId = ""]) async {
    final emplyeeId = AppPreferences().sharedPrefRead(StorageKeys.employeeId);
    Map<String, String> headers =
        ApiHeaders.getContextClientIdAndContextRoleIDHeaders();
    if (wishedJobId.isNotEmpty) {
      headers.addAll({
        WebFields.wishlistid: wishedJobId,
      });
    }
    await RestClient(_apiCallBacks).apiCall(
      requestType:
          wishedJobId.isNotEmpty ? RequestType.delete : RequestType.get,
      apiEndPoint: "${ApiEndPoints.employee}$emplyeeId${ApiEndPoints.wishlist}",
      extraHeader: headers,
    );
  }

  // Get Sheduled jobs API
  Future<void> getSheduledJobs() async {
    Map<String, String> headers = {
      ApiHeadersKey.employeeId:
          AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      apiEndPoint: ApiEndPoints.employeeJobNotInWishlist,
      extraHeader: headers,
    );
  }

  // Get And Delete Ignorelist jobs API
  Future<void> getAndDeleteIgnorelistJobs([String ignoredJobId = ""]) async {
    final emplyeeId = AppPreferences().sharedPrefRead(StorageKeys.employeeId);
    Map<String, String> headers =
        ApiHeaders.getContextClientIdAndContextRoleIDHeaders();
    if (ignoredJobId.isNotEmpty) {
      headers.addAll({
        WebFields.wishlistid: ignoredJobId,
      });
    }
    await RestClient(_apiCallBacks).apiCall(
      requestType:
          ignoredJobId.isNotEmpty ? RequestType.delete : RequestType.get,
      apiEndPoint:
          "${ApiEndPoints.employee}$emplyeeId${ApiEndPoints.ignorelist}",
      extraHeader: headers,
    );
  }

  // Update My Availibility  API
  Future<void> updateMyAvailibility(
    int switchStatus,
  ) async {
    Map requestParam = toUpdateMyAvailibilityJson(switchStatus);
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint: ApiEndPoints.updateMyAvailibility,
      requestType: RequestType.post,
      extraHeader: ApiHeaders.getContextClientIdAndContextRoleIDHeaders(),
    );
  }

  // Confrim Employee Call body
  Map<String, dynamic> toUpdateMyAvailibilityJson(
    int switchStatus,
  ) =>
      {
        WebFields.switchStatus: switchStatus,
        WebFields.employeeId:
            AppPreferences().sharedPrefRead(StorageKeys.employeeId),
        WebFields.clientId:
            AppPreferences().sharedPrefRead(StorageKeys.contextClientId),
      };

  // Drag and Drop Schedule Job to Wished Job  API
  Future<void> wishlistmobile(
    String employeeMessage,
    String jobId,
  ) async {
    final emplyeeId = AppPreferences().sharedPrefRead(StorageKeys.employeeId);
    Map<String, dynamic> requestParam = {
      WebFields.employeeMessage: employeeMessage,
      WebFields.jobid: jobId,
    };
    Map<String, String> headers = {
      WebFields.jobid: jobId,
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint:
          "${ApiEndPoints.employee}$emplyeeId${ApiEndPoints.wishlistmobile}",
      requestType: RequestType.post,
      extraHeader: headers,
    );
  }

  // Drag and Drop Schedule Job to ignored Job  API
  Future<void> ignorelistmobile(
    String employeeMessage,
    String jobId,
  ) async {
    final emplyeeId = AppPreferences().sharedPrefRead(StorageKeys.employeeId);
    Map<String, dynamic> requestParam = {
      WebFields.employeeMessage: employeeMessage,
      WebFields.jobid: jobId,
    };
    Map<String, String> headers = {
      WebFields.jobid: jobId,
    };
    headers.addAll(ApiHeaders.getContextClientIdAndContextRoleIDHeaders());
    await RestClient(_apiCallBacks).apiCall(
      requestParam: requestParam,
      apiEndPoint:
          "${ApiEndPoints.employee}$emplyeeId${ApiEndPoints.ignorelistmobile}",
      requestType: RequestType.post,
      extraHeader: headers,
    );
  }
}
