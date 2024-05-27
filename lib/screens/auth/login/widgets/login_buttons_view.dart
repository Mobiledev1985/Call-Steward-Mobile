import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/auth/login_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/or_view.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class LoginButtonsView extends StatelessWidget {
  final LoginController loginController;
  const LoginButtonsView({
    super.key,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return loginController.isLoading
              ? const Loading()
              : ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    loginController.login();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.green),
                  child: Text(AppMessagesKey.loginButtonText.tr),
                );
        }),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: OrView(),
        ),
        Visibility(
          visible: Platform.isIOS,
          child: Obx(
            () {
              return loginController.isLoadingApple
                  ? const Loading()
                  : ElevatedButton(
                      onPressed: loginController.appleSignIn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.appleLogo,
                            width: 26,
                            height: 26,
                          ),
                          const SpaceHorizontal(16),
                          Text(AppMessagesKey.siginWithApple.tr),
                        ],
                      ),
                    );
            },
          ),
        ),
        const SpaceVertical(20),
        Obx(() {
          return loginController.isLoadingGoogle
              ? const Loading()
              : ElevatedButton(
                  onPressed: loginController.signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.lightBlue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.googleLogo,
                        width: 26,
                        height: 26,
                      ),
                      const SpaceHorizontal(16),
                      Text(AppMessagesKey.siginWithGoogle.tr),
                    ],
                  ),
                );
        }),
        const SpaceVertical(32),
      ],
    );
  }
}
