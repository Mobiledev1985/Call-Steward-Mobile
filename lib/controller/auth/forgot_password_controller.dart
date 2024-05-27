import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/utils/utilities.dart';

class ForgotPasswordController extends GetxController implements ApiCallBacks {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isResetCodeButton = false;

  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKeyForSMS = GlobalKey();
  final GlobalKey<FormState> formKeyForUpdatePassword = GlobalKey();

  final RxBool _isLoading = RxBool(false);

  bool get isLoading => _isLoading.value;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  final RxBool _isLoadingForSMSCodeAPI = RxBool(false);

  bool get isLoadingForSMSCodeAPI => _isLoadingForSMSCodeAPI.value;
  set isLoadingForSMSCodeAPI(bool isLoading) =>
      _isLoadingForSMSCodeAPI.value = isLoading;

  final RxBool _isLoadingForOtp = RxBool(false);

  bool get isLoadingForOtp => _isLoadingForOtp.value;
  set isLoadingForOtp(bool isLoading) => _isLoadingForOtp.value = isLoading;

  void onForgotPassword() {
    if (formKey.currentState!.validate()) {
      ApiPresenter(this).forgotPassword(
          emailController.text.trim(), Get.find<ApiController>().loginUrl);
    }
  }

  void onForgotPasswordWithSMSCode({bool needValidation = true}) {
    if (needValidation) {
      if (formKeyForSMS.currentState!.validate()) {
        ApiPresenter(this).forgotPasswordWithSMSCode(
            emailController.text.trim(), Get.find<ApiController>().loginUrl);
      }
    } else {
      isResetCodeButton = true;
      ApiPresenter(this).forgotPasswordWithSMSCode(
          emailController.text.trim(), Get.find<ApiController>().loginUrl);
    }
  }

  void verifyOtp() {
    if (validateOtp()) {
      ApiPresenter(this).verifyOtp(
        emailController.text.trim(),
        Get.find<ApiController>().loginUrl,
        otpController.text.trim(),
      );
    }
  }

  bool validateOtp() {
    String otp = otpController.text.trim();
    if (otp.isEmpty) {
      Utilities.showErrorMessage('Please enter otp');
      return false;
    }
    if (otp.length != 6) {
      Utilities.showErrorMessage('Otp must be 6 digit code');
      return false;
    }
    return true;
  }

  void updatePassword() async {
    if (formKeyForUpdatePassword.currentState!.validate()) {
      await ApiPresenter(this).updatePassword(emailController.text.trim(),
          newPasswordController.text.trim(), otpController.text.trim());
      Get.until((route) => Get.currentRoute == RoutePaths.login);
    }
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
    if (ApiEndPoints.forgotPassword == apiEndPoint) {
      this.isLoading = isLoading;
    }
    if (ApiEndPoints.forgotPasswordWithSMSCode == apiEndPoint ||
        ApiEndPoints.resetPassword == apiEndPoint) {
      isLoadingForSMSCodeAPI = isLoading;
    }
    if (ApiEndPoints.verifyOtp == apiEndPoint) {
      isLoadingForOtp = isLoading;
    }
  }

  @override
  void onSuccess(object, String strMsg, String apiEndPoint) {
    switch (apiEndPoint) {
      case ApiEndPoints.forgotPassword:
        emailController.clear();
        Get.offNamed(RoutePaths.checkYourEmail);
        break;

      case ApiEndPoints.forgotPasswordWithSMSCode:
        Utilities.showMessage('${object['status_message']}', "");
        if (!isResetCodeButton &&
            object['status_message'].contains("Verification")) {
          Get.offNamed(RoutePaths.otp);
        }
        isResetCodeButton = false;
        break;

      case ApiEndPoints.verifyOtp:
        if (object['status_message'].toString().contains('Invalid')) {
          Utilities.showErrorMessage('Invalid code.');
          otpController.clear();
        }
        if (object['status_message'].toString().contains('verified')) {
          Get.offNamed(RoutePaths.updatePassword);
        }
        break;

      case ApiEndPoints.resetPassword:
        Utilities.showMessage(object['status_message']);
        Get.until((route) => Get.currentRoute == RoutePaths.login);
        emailController.clear();
        otpController.clear();
        newPasswordController.clear();
    }
  }
}
