import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/controller/auth/forgot_password_controller.dart';
import 'package:call_steward/screens/auth/forgot_password/widget/forgot_password_buttons.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/half_circle.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/utils/validators/validators.dart';
import 'package:call_steward/widgets/custom_text_field.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController =
        Get.put(ForgotPasswordController());
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
                onPressed: () => Get.back(),
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
                    child: Column(
                      children: [
                        Text(
                          AppMessagesKey.resetPassword.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.white),
                        ),
                        const SpaceVertical(22),
                        Text(
                          AppMessagesKey.enterYourEmailText.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: ColorPalette.white),
                        ),
                        const SpaceVertical(30),
                        Form(
                          key: forgotPasswordController.formKey,
                          child: CustomTextField(
                            title: AppMessagesKey.email.tr,
                            hintText: AppMessagesKey.enterEmail.tr,
                            controller:
                                forgotPasswordController.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.emailValidator,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        const SpaceVertical(50),
                        ForgotPasswordButtons(
                            forgotPasswordController: forgotPasswordController)
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
