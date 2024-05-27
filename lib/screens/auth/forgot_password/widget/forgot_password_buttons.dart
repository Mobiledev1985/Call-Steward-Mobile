import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/controller/auth/forgot_password_controller.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/or_view.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/widgets/loading.dart';

class ForgotPasswordButtons extends StatelessWidget {
  final ForgotPasswordController forgotPasswordController;
  const ForgotPasswordButtons(
      {super.key, required this.forgotPasswordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return ElevatedButton(
            onPressed: forgotPasswordController.isLoading
                ? () {}
                : () {
                    // forgotPasswordController.emailController.clear();
                    Get.toNamed(RoutePaths.forgotPasswordWithSMS);
                  },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.lightBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.call_outlined,
                  color: ColorPalette.white,
                ),
                const SpaceHorizontal(16),
                Text(AppMessagesKey.sendMeResetCode.tr),
              ],
            ),
          );
        }),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 36),
          child: OrView(),
        ),
        Obx(() {
          return forgotPasswordController.isLoading
              ? const Loading()
              : ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    forgotPasswordController.onForgotPassword();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.green),
                  child: Text(AppMessagesKey.resetPassword.tr));
        }),
        const SpaceVertical(32),
      ],
    );
  }
}
