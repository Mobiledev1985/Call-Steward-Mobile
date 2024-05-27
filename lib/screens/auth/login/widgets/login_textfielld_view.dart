import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/auth/api_controller.dart';
import 'package:call_steward/controller/auth/login_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/auth/login/widgets/select_server_radio_widget.dart';
import 'package:call_steward/utils/validators/validators.dart';
import 'package:call_steward/widgets/custom_text_field.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class LoginTextFieldsView extends StatelessWidget {
  final LoginController loginController;
  final ApiController apiController;
  const LoginTextFieldsView({
    super.key,
    required this.loginController,
    required this.apiController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginController.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller:
                TextEditingController(text: AppMessagesKey.selectServer.tr),
            readOnly: true,
            suffix: InkWell(
              onTap: () => selectServerDialog(context, apiController),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(apiController.selectedServer)),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: ColorPalette.green,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SpaceVertical(20),
          CustomTextField(
            title: AppMessagesKey.email.tr,
            hintText: AppMessagesKey.enterEmail.tr,
            controller: loginController.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.emailValidator,
          ),
          const SpaceVertical(20),
          Obx(
            () {
              return CustomTextField(
                title: AppMessagesKey.password.tr,
                hintText: AppMessagesKey.enterPassword.tr,
                controller: loginController.passwordController,
                textInputAction: TextInputAction.done,
                validator: Validators.passwordValidator,
                obscureText: loginController.isPasswordVisible,
                suffix: InkWell(
                  onTap: () {
                    loginController.isPasswordVisible =
                        !loginController.isPasswordVisible;
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 4),
                    child: Icon(
                      loginController.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 16,
                      color: ColorPalette.green,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void selectServerDialog(
    BuildContext context,
    ApiController apiController,
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Obx(
              () {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        AppMessagesKey.selectServer.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(),
                      ),
                    ),
                    const Divider(
                      thickness: 1.3,
                      height: 0,
                    ),
                    ...apiController.server
                        .map((e) => SelectServerRadioWidget(
                            title: e,
                            groupValue: apiController.selectedServerForDialog,
                            onChanged: (value) {
                              apiController.selectedServerForDialog = value!;
                            }))
                        .toList(),
                    const Divider(
                      thickness: 1.3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              apiController.selectedServerForDialog =
                                  apiController.selectedServer;
                              Get.back();
                            },
                            child: Text(
                              AppMessagesKey.cancel.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
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
                              apiController.selectedServer =
                                  apiController.selectedServerForDialog;
                              Get.back();
                            },
                            child: Text(
                              AppMessagesKey.save.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: ColorPalette.green,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SpaceVertical(10)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
