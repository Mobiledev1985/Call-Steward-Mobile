import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/widgets/half_circle.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class CheckYourMainScreen extends StatelessWidget {
  const CheckYourMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorPalette.blue,
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            child: HalfCircle(),
          ),
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
          Padding(
            padding: EdgeInsets.only(
                top: Utilities.isTablet() ? 350 : 218,
                left: Utilities.isTablet() ? 130 : 0,
                right: Utilities.isTablet() ? 130 : 0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
              child: Column(
                children: [
                  Text(
                    AppMessagesKey.checkYourMail.tr,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.white),
                  ),
                  const SpaceVertical(22),
                  Text(
                    AppMessagesKey.weHaveSentEmail.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ColorPalette.white),
                  ),
                  const SpaceVertical(50),
                  ElevatedButton(
                      onPressed: () => onMailApp(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.green),
                      child: Text(AppMessagesKey.openMail.tr)),
                  const SpaceVertical(20),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      AppMessagesKey.iWillCheckLater.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorPalette.green),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void onMailApp(BuildContext context) async {
    var result = await OpenMailApp.openMailApp();

    // If no mail apps found, show error
    if (!result.didOpen && !result.canOpen) {
      Utilities.showErrorMessage('No app found');
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: Get.context ?? context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }
}
