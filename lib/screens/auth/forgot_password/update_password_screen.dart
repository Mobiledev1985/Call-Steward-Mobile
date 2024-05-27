import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/auth/forgot_password_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/half_circle.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/utils/validators/validators.dart';
import 'package:call_steward/widgets/custom_text_field.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController =
        Get.find<ForgotPasswordController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.blue,
        body: Stack(
          children: [
            const Positioned(top: 0, child: HalfCircle()),
            Positioned(
              top: 46,
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
                onPressed: () {
                  forgotPasswordController.emailController.clear();
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorPalette.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Utilities.isTablet() ? 350 : 218,
                  left: Utilities.isTablet() ? 130 : 0,
                  right: Utilities.isTablet() ? 130 : 0),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 0),
                    child: Form(
                      key: forgotPasswordController.formKeyForUpdatePassword,
                      child: Column(
                        children: [
                          Text(
                            AppMessagesKey.updatePassword.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.white),
                          ),
                          const SpaceVertical(30),
                          CustomTextField(
                            title: AppMessagesKey.newPassword.tr,
                            hintText: AppMessagesKey.enterNewPassword.tr,
                            controller:
                                forgotPasswordController.newPasswordController,
                            keyboardType: TextInputType.text,
                            validator: Validators.passwordValidator,
                          ),
                          const SpaceVertical(20),
                          CustomTextField(
                            title: AppMessagesKey.confirmPassword.tr,
                            hintText: AppMessagesKey.enterConfirmPassword.tr,
                            controller: forgotPasswordController
                                .confirmPasswordController,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                Validators.passwordConfirmValidator(
                                    value,
                                    forgotPasswordController
                                        .newPasswordController.text
                                        .trim()),
                          ),
                          const SpaceVertical(50),
                          Obx(
                            () {
                              return forgotPasswordController
                                      .isLoadingForSMSCodeAPI
                                  ? const Loading()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorPalette.green,
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        forgotPasswordController
                                            .updatePassword();
                                      },
                                      child: Text(
                                          AppMessagesKey.updatePassword.tr),
                                    );
                            },
                          )
                        ],
                      ),
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
