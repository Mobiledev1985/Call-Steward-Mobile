import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import 'package:call_steward/utils/notification/firebase_notification_service.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/localization/languages.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/screens/auth/language_screen.dart';
import 'routes/routes.dart';

import 'utils/theme/app_theme.dart';
import 'package:call_steward/firebase_options.dart';
import 'package:call_steward/utils/notification/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness: Brightness.dark, // For iOS (dark icons)
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseNotificationService.firebaseMessagingIntilization();

  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AppThemeMixin {
  @override
  void initState() {
    LocalNotificationService.initialize(context);
    super.initState();
  }

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ApiController());

    return GetMaterialApp(
      title: 'Call Steward',
      theme: appTheme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: getIntialScreen(),
      home: const LanguageScreen(),
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
      locale: AppPreferences().sharedPrefRead(StorageKeys.languageCode) != null
          ? Locale(AppPreferences().sharedPrefRead(StorageKeys.languageCode),
              AppPreferences().sharedPrefRead(StorageKeys.countryCode))
          : const Locale('en', 'US'),
    );
  }

  String getIntialScreen() {
    if (AppPreferences().sharedPrefRead(StorageKeys.languageCode) == null) {
      return RoutePaths.language;
    } else {
      return RoutePaths.home;
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
