import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:call_steward/routes/route_paths.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:intl/intl.dart';
import '../constants/colorpalette.dart';

// Useful utilies of the app
class Utilities {
  static Future<bool> isConnectedNetwork() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isTablet() => Get.width < 500 ? false : true;

  static void openUrlInWebBrowser(String url) {
    InAppBrowserClassOptions options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(
        toolbarTopBackgroundColor: Colors.grey[350],
      ),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );
    final InAppBrowser browser = InAppBrowser();

    //Navigate to in app web browser
    browser.openUrlRequest(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
      options: options,
    );
  }

  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static TimeOfDay stringToTimeOfDay(String tod) {
    final cleanedTimeString =
        tod.replaceAll('\u202F', ''); // Remove non-breaking space character

    int hour = int.parse(cleanedTimeString.split(':')[0]);
    final minute = cleanedTimeString.split(':').length > 1
        ? int.parse(cleanedTimeString.split(':')[1].substring(0, 2))
        : 0;
    final isAM = cleanedTimeString
            .substring(cleanedTimeString.length - 2)
            .toLowerCase() ==
        'am';

    if (!isAM && hour != 12) {
      hour += 12;
    } else if (isAM && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  static TimeOfDay stringToTimeOfDayFor24Hours(String tod) {
    final cleanedTimeString =
        tod.replaceAll('\u202F', ''); // Remove non-breaking space character

    int hour = int.parse(cleanedTimeString.split(':')[0]);
    final minute = cleanedTimeString.split(':').length > 1
        ? int.parse(cleanedTimeString.split(':')[1].substring(0, 2))
        : 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    return "${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}";
  }

  static String formatTimeOfDay(TimeOfDay time, String format) {
    DateTime now = DateTime.now();
    DateTime dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    DateFormat formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static showErrorMessage(String message, [String title = "Error"]) {
    Get.rawSnackbar(title: title, message: message);
  }

  static showMessage(String message, [String title = "Success"]) {
    Get.rawSnackbar(title: title.isEmpty ? null : title, message: message);
  }

  static Future<File?> pickImage(ImageSource imageSource) async {
    final XFile? image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      return cropImage(File(image.path));
    }
    return null;
  }

  // A helper function to get the correct suffix for the day
  static String getSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String getDateFormat(String format) => switch (format) {
        "DD MMMM YYYY" => 'dd MMMM y',
        "DD MMM YYYY" => 'dd MMM y',
        "DD-MM-YY" => 'dd-MM-yy',
        "YYYY-MM-DD" => 'yyyy-MM-dd',
        "YYYY MMMM DD" => 'yyyy MMMM dd',
        "YYYY MMM DD" => 'yyyy MMM dd',
        "MMMM DD YYYY" => 'MMMM d y',
        _ => 'MMMM d y',
      };

  static Future<File?> cropImage(File? file) async {
    final CroppedFile? cropedFile = await ImageCropper()
        .cropImage(sourcePath: file!.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
        statusBarColor: Colors.black,
      )
    ]);
    if (cropedFile != null) {
      return File(cropedFile.path);
    }
    return null;
  }

  static bool is24HourFormat(String time) {
    return !time.contains('a');
  }

  static void tokenExpiredDialog() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: IntrinsicHeight(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                children: [
                  const SpaceVertical(40),
                  Text(
                    AppMessagesKey.tokenExpired.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorPalette.blackText,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SpaceVertical(20),
                  const Divider(
                    thickness: 1.3,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(RoutePaths.login);
                    },
                    child: Text(
                      AppMessagesKey.login.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorPalette.green,
                          ),
                    ),
                  ),
                  const SpaceVertical(10)
                ],
              )),
        ),
      ),
    );
  }

  static Future<File?> showImagePickBottomSheet(BuildContext context) async {
    FocusScope.of(context).unfocus();
    File? file;
    await showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await pickImage(ImageSource.camera).then((value) {
                        file = value;
                        Navigator.pop(context);
                      });
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.camera,
                          size: 40,
                          color: ColorPalette.blue,
                        ),
                        Text(
                          AppMessagesKey.camera.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ColorPalette.blue),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await pickImage(ImageSource.gallery).then((value) {
                        file = value;
                        Navigator.pop(context);
                      });
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 40,
                          color: ColorPalette.blue,
                        ),
                        Text(
                          AppMessagesKey.gallery.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ColorPalette.blue),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    return file;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
