import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/model/auth/login_model.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/api/request_code.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';

class LoginController extends GetxController implements ApiCallBacks {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///For Form Validation using GlobalKey
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Pass this value in all login APIs.
  final String appSource = "native-app";

  final RxBool _isLoading = RxBool(false);

  /// [isLoading] is bool value, it return true when API call start and when it finished it will return false
  bool get isLoading => _isLoading.value;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;

  final RxBool _isPasswordVisible = RxBool(true);

  /// [isPasswordVisible] is bool value, it return true when API call start and when it finished it will return false
  bool get isPasswordVisible => _isPasswordVisible.value;
  set isPasswordVisible(bool isPasswordVisible) =>
      _isPasswordVisible.value = isPasswordVisible;

  final RxBool _isLoadingGoogle = RxBool(false);

  bool get isLoadingGoogle => _isLoadingGoogle.value;
  set isLoadingGoogle(bool isLoading) => _isLoadingGoogle.value = isLoading;

  final RxBool _isLoadingApple = RxBool(false);

  bool get isLoadingApple => _isLoadingApple.value;
  set isLoadingApple(bool isLoading) => _isLoadingApple.value = isLoading;

  bool isGoogleSigning = true;
  final String clientId = '';
  final String state = '';

  String androidClientId = "";

  void login() async {
    if (formKey.currentState!.validate()) {
      final deviceToken = await FirebaseMessaging.instance.getToken();
      final ApiController apiController = Get.find<ApiController>();
      isLoading = true;
      await ApiPresenter(this).login(
        emailController.text.trim(),
        passwordController.text.trim(),
        apiController.loginUrl,
        getLanguage(apiController),
        deviceToken ?? '',
      );
      isLoading = false;
    }
  }

  ///This method called when Google Signing and Apple Signing return [token].
  void socialLogin(String? token) async {
    final ApiController apiController = Get.find<ApiController>();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    await ApiPresenter(this).socialLogin(
      apiController.loginAPIParameterUrl,
      token ?? "",
      // appSource,
      deviceToken ?? "",
      getLanguage(apiController),
      isGoogleSigning,
    );
    isGoogleSigning = true;
  }

  /// Sign in with Google.
  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
              serverClientId: Platform.isAndroid ? androidClientId : null)
          .signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        socialLogin(googleSignInAuthentication.idToken);
      }
    } catch (e) {
      Utilities.showErrorMessage('Something went wrong');
    }
  }

  /// Sign in with AppleId.
  void appleSignIn() async {
    isGoogleSigning = false;
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: clientId,
          redirectUri: Uri.parse(Get.find<ApiController>().loginUrl),
        ),
        state: state,
        nonce: generateRandomString(),
      );
      socialLogin(appleCredential.identityToken);
    } catch (exception) {
      Utilities.showErrorMessage('Something went wrong');
    }
    return null;
  }

  String getLanguage(ApiController apiController) =>
      switch (apiController.selectedLanguageCode) {
        'en' => 'en',
        'es' => 'sp',
        'fr' => 'fr',
        _ => 'en'
      };

  String generateRandomString() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random.secure();
    return List.generate(11, (_) => chars[random.nextInt(chars.length)]).join();
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
    if (apiEndPoint == ApiEndPoints.socialLogin) {
      if (isGoogleSigning) {
        _isLoadingGoogle.value = isLoading;
      } else {
        _isLoadingApple.value = isLoading;
      }
    }
  }

  @override
  void onSuccess(object, String strMsg, String apiEndPoint) async {
    if (apiEndPoint == ApiEndPoints.socialLogin &&
        (object['result'] is String)) {
      Utilities.showErrorMessage(object['status_message']);
      GoogleSignIn().signOut();
    } else if (apiEndPoint == ApiEndPoints.appleLogin &&
        (object['result'] is String)) {
      Utilities.showErrorMessage(object['status_message']);
    } else if (object['status_code'] != "0") {
      LoginModel loginModel = LoginModel.fromJson(object);
      storeUserData(loginModel.result);
      Get.offAllNamed(RoutePaths.employeeLoadingScreen, arguments: false);
      emailController.clear();
      passwordController.clear();
    } else {
      Utilities.showErrorMessage(object['status_message']);
    }
  }

  /// Store user information locally.
  /// [Result] is an object of login model class which contains user information.
  void storeUserData(Result result) {
    AppPreferences()
        .sharedPrefWrite(StorageKeys.languageCode, Get.locale!.languageCode);
    AppPreferences()
        .sharedPrefWrite(StorageKeys.countryCode, Get.locale!.countryCode);
    AppPreferences().sharedPrefWrite(StorageKeys.token, result.token);
    AppPreferences().sharedPrefWrite(StorageKeys.userId, result.user.id);
    AppPreferences()
        .sharedPrefWrite(StorageKeys.firstName, result.user.firstName ?? "");
    AppPreferences()
        .sharedPrefWrite(StorageKeys.lastName, result.user.lastName ?? "");

    if (result.user.employees != null && result.user.employees!.isNotEmpty) {
      AppPreferences().sharedPrefWrite(
          StorageKeys.employeeId, result.user.employees!.first.id);
      if (result.user.employees!.first.clientEmployee!.clients != null) {
        AppPreferences().sharedPrefWrite(StorageKeys.timezone,
            result.user.employees!.first.clientEmployee!.clients!.timezone);

        AppPreferences().sharedPrefWrite(
            StorageKeys.client,
            result.user.employees!.first.clientEmployee!.clients!.subdomain ??
                "");
      }

      AppPreferences().sharedPrefWrite(StorageKeys.contextClientId,
          result.user.employees!.first.clientEmployee!.clientId);
      AppPreferences().sharedPrefWrite(
          StorageKeys.contextRole, result.user.employees!.first.roleId);
    }
    if (result.user.image != null) {
      AppPreferences()
          .sharedPrefWrite(StorageKeys.userImage, result.user.image);
    }
    if (result.user.phones != null && result.user.phones!.isNotEmpty) {
      AppPreferences().sharedPrefWrite(
          StorageKeys.cellPhone, result.user.phones![0].phoneNumber);
      if (result.user.phones!.length >= 2) {
        if (result.user.phones![1].phoneNumber != 0) {
          AppPreferences().sharedPrefWrite(
              StorageKeys.homePhone, result.user.phones![1].phoneNumber);
        }
      }
    }
  }
}
