import 'package:call_steward/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';

class SessionManagerScreen extends GetView {
  const SessionManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              AppImages.backgroud,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                const SpaceVertical(110),
                SvgPicture.asset(
                  AppImages.appLogo,
                  width: 135,
                  height: 135,
                ),
                const SpaceVertical(80),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Utilities.openUrlInWebBrowser(
                          AppPreferences().sharedPrefRead(StorageKeys.token));
                    },
                    child: Text(
                      AppMessagesKey.continueSession.tr,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      AppPreferences().sharedPrefRemove(StorageKeys.token);
                      Get.offNamed(RoutePaths.login);
                    },
                    child: Text(
                      AppMessagesKey.newSession.tr,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Language {
  final String languageName;
  final Locale local;
  Language({
    required this.languageName,
    required this.local,
  });
}
