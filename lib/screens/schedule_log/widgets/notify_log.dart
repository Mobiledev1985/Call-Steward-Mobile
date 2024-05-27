import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tzl;
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/schedule/schedule_notifi_and_action_log_controller.dart';
import 'package:call_steward/screens/wishlist/widgets/no_data_found.dart';
import 'package:call_steward/model/schedule/notify_log_model.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/schedule_log/widgets/common_schedule_row.dart';
import 'package:call_steward/widgets/custom_expansion_pannel.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/widgets/wthite_box_with_border.dart';

class NotifyLog extends StatefulWidget {
  const NotifyLog({super.key});

  @override
  State<NotifyLog> createState() => _NotifyLogState();
}

class _NotifyLogState extends State<NotifyLog> {
  final ScheduleNotifyAndActionController scheduleNotifyAndActionController =
      Get.find<ScheduleNotifyAndActionController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    tzl.initializeTimeZones();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          scheduleNotifyAndActionController.loadMoreNotifyLogData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return scheduleNotifyAndActionController.firstTimeNotifyLogisLoading
            ? const Center(
                heightFactor: 2,
                widthFactor: 2,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Loading(
                    color: ColorPalette.blue,
                  ),
                ),
              )
            : scheduleNotifyAndActionController.notifyLogModel.result != null &&
                    scheduleNotifyAndActionController
                        .notifyLogModel.result!.data!.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            scheduleNotifyAndActionController.notifyLogModel =
                                NotifyLogModel();
                            scheduleNotifyAndActionController
                                .getNotifyLog(true);
                          },
                          child: ListView.separated(
                            controller: _scrollController,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: scheduleNotifyAndActionController
                                .notifyLogModel.result!.data!.length,
                            itemBuilder: (_, index) {
                              final currentNotifyLogData =
                                  scheduleNotifyAndActionController
                                      .notifyLogModel.result!.data![index];
                              return CustomExpansionPanel(
                                key: UniqueKey(),
                                onTap: () {
                                  scheduleNotifyAndActionController
                                      .currentOpenItemForNotifyLog
                                      .value = scheduleNotifyAndActionController
                                              .currentOpenItemForNotifyLog
                                              .value ==
                                          index
                                      ? -1
                                      : index;
                                  scheduleNotifyAndActionController
                                      .notifyLogModel.result!.data!
                                      .refresh();
                                },
                                isOpenDefault: scheduleNotifyAndActionController
                                        .currentOpenItemForNotifyLog.value ==
                                    index,
                                header: Text.rich(
                                  TextSpan(
                                    text: '${AppMessagesKey.timestamp.tr}:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: ColorPalette.blueText,
                                        ),
                                    children: [
                                      TextSpan(
                                        text:
                                            " ${scheduleNotifyAndActionController.formatDate(currentNotifyLogData.createdAt!)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: ColorPalette.blackText,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                body: WhiteBoxWithBorder(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        CommonScheduleRow(
                                          firsTitle: AppMessagesKey.jobID.tr,
                                          firstSubtitle:
                                              '${currentNotifyLogData.messageId}',
                                          secondTitle:
                                              AppMessagesKey.timestamp.tr,
                                          seconfSubtitle:
                                              scheduleNotifyAndActionController
                                                  .formatDate(
                                                      currentNotifyLogData
                                                          .createdAt!),
                                        ),
                                        CommonScheduleRow(
                                          firsTitle:
                                              AppMessagesKey.initiator.tr,
                                          firstSubtitle:
                                              '${currentNotifyLogData.notifiable!.employable!.firstName}${currentNotifyLogData.notifiable!.employable!.lastName}',
                                          secondTitle: AppMessagesKey.type.tr,
                                          seconfSubtitle:
                                              currentNotifyLogData.type ?? "",
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${AppMessagesKey.content.tr}:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color:
                                                        ColorPalette.blueText,
                                                  ),
                                            ),
                                            const SpaceVertical(4),
                                            Html(
                                              data: currentNotifyLogData.body ??
                                                  "",
                                              style: {
                                                "*": Style(
                                                  fontSize: FontSize(12.00),
                                                  color: ColorPalette.blackText,
                                                  margin: Margins.all(0),
                                                ),
                                              },
                                            )
                                          ],
                                        ),
                                        CommonScheduleRow(
                                          firsTitle: AppMessagesKey.status.tr,
                                          firstSubtitle:
                                              currentNotifyLogData.status ?? "",
                                          secondTitle:
                                              AppMessagesKey.serverResponse.tr,
                                          seconfSubtitle: '--',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const SpaceVertical(6),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: scheduleNotifyAndActionController
                            .notifyLogisLoading,
                        child: const Center(
                          heightFactor: 2,
                          widthFactor: 2,
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Loading(
                              color: ColorPalette.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const NoDataFound();
      },
    );
  }
}
