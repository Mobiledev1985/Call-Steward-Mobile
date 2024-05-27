import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/constants/app_images.dart';
import 'package:call_steward/constants/app_strings.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/routes/route_paths.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Language> languages = [
      Language(
          languageName: AppStrings.english, local: const Locale('en', 'US')),
      Language(
          languageName: AppStrings.spanish, local: const Locale('es', 'ES')),
      Language(
          languageName: AppStrings.french, local: const Locale('fr', 'CA')),
    ];

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
            Center(
              child: Column(
                children: [
                  const SpaceVertical(110),
                  SvgPicture.asset(
                    AppImages.appLogo,
                    width: 135,
                    height: 135,
                  ),
                  const SpaceVertical(80),
                  Text(
                    AppStrings.toContinue,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SpaceVertical(30),
                  ...languages
                      .map(
                        (language) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.find<ApiController>().selectedLanguageCode =
                                  language.local.languageCode;
                              Get.updateLocale(language.local);
                              Get.toNamed(RoutePaths.login);
                            },
                            child: Text(
                              language.languageName,
                            ),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
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
