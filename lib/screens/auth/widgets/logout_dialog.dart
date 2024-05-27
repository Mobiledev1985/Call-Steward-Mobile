import 'package:call_steward/controller/auth/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.put(LogoutController());
    return Dialog(
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
                AppMessagesKey.areYousure.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorPalette.blackText,
                    ),
              ),
              const SpaceVertical(20),
              const Divider(
                thickness: 1.3,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        AppMessagesKey.no.tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorPalette.green,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1.3,
                    height: 40,
                    color: Theme.of(context).dividerColor,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        logoutController.logout();
                      },
                      child: Text(
                        AppMessagesKey.yes.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorPalette.green,
                            ),
                      ),
                    ),
                  )
                ],
              ),
              const SpaceVertical(10)
            ],
          ),
        ),
      ),
    );
  }
}
