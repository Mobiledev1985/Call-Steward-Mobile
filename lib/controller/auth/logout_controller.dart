import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:call_steward/api/api_interface.dart';
import 'package:call_steward/api/api_presenter.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/widgets/full_screen_loading_dialog.dart';

class LogoutController extends GetxController implements ApiCallBacks {
  Future<void> logout() async {
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FullScreenLoadingDialog(),
    );
    await Future.wait([
      ApiPresenter(this).logout(),
      GoogleSignIn().signOut(),
    ]);
    Get.back();
  }

  @override
  void onConnectionError(String error, String apiEndPoint) {}

  @override
  void onError(String errorMsg, String apiEndPoint) {
    Utilities.showErrorMessage(errorMsg);
  }

  @override
  void onLoading(bool isLoading, String apiEndPoint) {}

  @override
  void onSuccess(object, String strMsg, String apiEndPoint) {
    AppPreferences().sharedPrefEraseAllData();
    Get.offAllNamed(RoutePaths.language);
  }
}
