import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/controller/auth/login_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/half_circle.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/screens/auth/login/widgets/login_buttons_view.dart';
import 'package:call_steward/screens/auth/login/widgets/login_textfielld_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRegistered = Get.isRegistered<LoginController>();
    late LoginController loginController;
    if (!isRegistered) {
      loginController = Get.put(LoginController());
    } else {
      loginController = Get.find<LoginController>();
    }

    final ApiController apiController = Get.find<ApiController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.blue,
        body: Stack(
          children: [
            const Positioned(top: 0, child: HalfCircle()),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
              child: SvgPicture.asset(
                AppImages.appLogo,
                width: 90,
                height: 90,
              ),
            ),
            Positioned(
              top: 30,
              left: 16,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorPalette.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Utilities.isTablet() ? 350 : 196,
                  left: Utilities.isTablet() ? 130 : 0,
                  right: Utilities.isTablet() ? 130 : 0),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 0),
                    child: Column(
                      children: [
                        Text(
                          AppMessagesKey.login.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.white),
                        ),
                        const SpaceVertical(10),
                        LoginTextFieldsView(
                            loginController: loginController,
                            apiController: apiController),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              loginController.emailController.clear();
                              loginController.passwordController.clear();
                              FocusScope.of(context).unfocus();
                              Get.toNamed(RoutePaths.forgotPassword);
                            },
                            child: Text(
                              AppMessagesKey.forgotPassword.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorPalette.white,
                                      fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        LoginButtonsView(loginController: loginController),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
