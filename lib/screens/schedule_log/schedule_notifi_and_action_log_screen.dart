import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/schedule/schedule_notifi_and_action_log_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/schedule_log/widgets/action_log.dart';
import 'package:call_steward/screens/schedule_log/widgets/notify_log.dart';

class ScheduleNotifyAndActionLogScreen extends StatefulWidget {
  const ScheduleNotifyAndActionLogScreen({super.key});

  @override
  State<ScheduleNotifyAndActionLogScreen> createState() =>
      _ScheduleNotifyAndActionLogScreenState();
}

class _ScheduleNotifyAndActionLogScreenState
    extends State<ScheduleNotifyAndActionLogScreen> {
  final ScheduleNotifyAndActionController scheduleNotifyAndActionController =
      Get.put(ScheduleNotifyAndActionController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await scheduleNotifyAndActionController.getNotifyLog();
    await scheduleNotifyAndActionController.getAcationLog();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppMessagesKey.notifyAndActionLog.tr),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        scheduleNotifyAndActionController.selectedTabIndex = 0;
                      },
                      child: Obx(
                        () {
                          return Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: scheduleNotifyAndActionController
                                          .selectedTabIndex ==
                                      0
                                  ? ColorPalette.orange
                                  : ColorPalette.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppMessagesKey.notifyLog.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: scheduleNotifyAndActionController
                                                  .selectedTabIndex ==
                                              0
                                          ? ColorPalette.white
                                          : ColorPalette.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        scheduleNotifyAndActionController.selectedTabIndex = 1;
                      },
                      child: Obx(
                        () {
                          return Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: scheduleNotifyAndActionController
                                          .selectedTabIndex ==
                                      1
                                  ? ColorPalette.orange
                                  : ColorPalette.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppMessagesKey.actionLog.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: scheduleNotifyAndActionController
                                                  .selectedTabIndex ==
                                              1
                                          ? ColorPalette.white
                                          : ColorPalette.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return scheduleNotifyAndActionController.selectedTabIndex == 0
                      ? const NotifyLog()
                      : const ActionLog();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
