import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/controller/auth/forgot_password_controller.dart';
import 'package:call_steward/widgets/loading.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinputFocusNode = FocusNode();

  final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 50,
    textStyle: const TextStyle(
        fontSize: 20, color: ColorPalette.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: ColorPalette.white, width: 0.6),
      borderRadius: BorderRadius.circular(4),
    ),
  );

  @override
  void initState() {
    super.initState();
    pinputFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.blue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorPalette.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                child: Text(
                  AppMessagesKey.twoFactorAuthentication.tr,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorPalette.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Text(
                AppMessagesKey.enterCode.tr,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorPalette.white,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SpaceVertical(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomPinput(
                  controller: forgotPasswordController.otpController,
                  useNativeKeyboard: false,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme,
                  submittedPinTheme: defaultPinTheme,
                  length: 6,
                  //      keyboardType: TextInputType.number,
                  focusNode: pinputFocusNode,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  // onLongPress: () {
                  //   forgotPasswordController.otpController.clear();
                  //   Clipboard.getData(Clipboard.kTextPlain).then((value) {
                  //     if (value != null && value.text != null) {
                  //       forgotPasswordController.otpController.text =
                  //           value.text ?? "";
                  //     }
                  //   });
                  // },
                  // onTap: () {
                  //   pinputFocusNode.unfocus();
                  // },
                  showCursor: true,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                ),
              ),
              const SpaceVertical(24),
              Text(
                AppMessagesKey.didNotreciveCode.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorPalette.white,
                    ),
              ),
              const SpaceVertical(10),
              Obx(
                () {
                  return forgotPasswordController.isLoadingForSMSCodeAPI
                      ? const Loading()
                      : TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            forgotPasswordController
                                .onForgotPasswordWithSMSCode(
                                    needValidation: false);
                          },
                          child: Text(
                            AppMessagesKey.resendCode.tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ColorPalette.green,
                                ),
                          ),
                        );
                },
              ),
              NumericKeyboard(
                onKeyboardTap: (value) {
                  if (forgotPasswordController.otpController.text.length < 6) {
                    forgotPasswordController.otpController.text =
                        forgotPasswordController.otpController.text + value;
                  }
                },
                textColor: ColorPalette.white,
                rightButtonFn: () {
                  forgotPasswordController.otpController.delete();
                },
                rightIcon: const Icon(
                  Icons.backspace,
                  color: ColorPalette.white,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 14,
                ),
                child: Obx(
                  () {
                    return forgotPasswordController.isLoadingForOtp
                        ? const Loading()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPalette.green),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              forgotPasswordController.verifyOtp();
                            },
                            child: Text(
                              AppMessagesKey.continueText.tr,
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPinput extends StatefulWidget {
  final TextEditingController controller;
  final bool useNativeKeyboard;
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final PinTheme submittedPinTheme;
  final int length;
  final FocusNode focusNode;
  final PinputAutovalidateMode pinputAutovalidateMode;
  final bool showCursor;
  final AndroidSmsAutofillMethod androidSmsAutofillMethod;

  const CustomPinput({
    Key? key,
    required this.controller,
    required this.useNativeKeyboard,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.submittedPinTheme,
    required this.length,
    required this.focusNode,
    required this.pinputAutovalidateMode,
    required this.showCursor,
    required this.androidSmsAutofillMethod,
  }) : super(key: key);

  @override
  State<CustomPinput> createState() => _CustomPinputState();
}

class _CustomPinputState extends State<CustomPinput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        final menuItems = [
          const PopupMenuItem(
            value: 'paste',
            child: Text('Paste'),
          ),
        ];

        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            position.dx,
            position.dy - 50,
            position.dx + renderBox.size.width,
            position.dy + renderBox.size.height,
          ),
          items: menuItems,
        ).then((value) {
          if (value == 'paste') {
            Clipboard.getData(Clipboard.kTextPlain).then((value) {
              if (value != null && value.text != null) {
                final newText = value.text;
                final selection = TextSelection.collapsed(
                  offset: newText!.length,
                );
                final newEditingValue = TextEditingValue(
                  text: newText,
                  selection: selection,
                  composing: TextRange.empty,
                );
                if (newEditingValue.text.length == 6) {
                  widget.controller.clear();
                  widget.controller.value = newEditingValue;
                }
              }
            });
          }
        });
      },
      child: Pinput(
        controller: widget.controller,
        useNativeKeyboard: widget.useNativeKeyboard,
        defaultPinTheme: widget.defaultPinTheme,
        focusedPinTheme: widget.focusedPinTheme,
        submittedPinTheme: widget.submittedPinTheme,
        length: widget.length,
        focusNode: widget.focusNode,
        pinputAutovalidateMode: widget.pinputAutovalidateMode,
        showCursor: widget.showCursor,
        androidSmsAutofillMethod: widget.androidSmsAutofillMethod,
      ),
    );
  }
}
