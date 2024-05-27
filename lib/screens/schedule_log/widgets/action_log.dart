import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/screens/wishlist/widgets/no_data_found.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/model/schedule/action_log_model.dart';
import 'package:call_steward/controller/schedule/schedule_notifi_and_action_log_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/schedule_log/widgets/common_schedule_row.dart';
import 'package:call_steward/widgets/custom_expansion_pannel.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/widgets/wthite_box_with_border.dart';

class ActionLog extends StatefulWidget {
  const ActionLog({super.key});

  @override
  State<ActionLog> createState() => _ActionLogState();
}

class _ActionLogState extends State<ActionLog> {
  final ScheduleNotifyAndActionController scheduleNotifyAndActionController =
      Get.find<ScheduleNotifyAndActionController>();
  final ScrollController _scrollController = ScrollController();
  final HomeControlller homeControlller = Get.find<HomeControlller>();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          scheduleNotifyAndActionController.loadMoreActionLogData();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return scheduleNotifyAndActionController.firstTimeActionLogisLoading
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
            : scheduleNotifyAndActionController.actionLogModel.result != null
                ? Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            scheduleNotifyAndActionController.actionLogModel =
                                ActionLogModel();
                            scheduleNotifyAndActionController
                                .getAcationLog(true);
                          },
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: scheduleNotifyAndActionController
                                .actionLogModel.result!.data!.length,
                            itemBuilder: (_, index) {
                              final currentActionData =
                                  scheduleNotifyAndActionController
                                      .actionLogModel.result!.data![index];
                              return CustomExpansionPanel(
                                key: UniqueKey(),
                                onTap: () {
                                  scheduleNotifyAndActionController
                                      .currentOpenItemForActionLog
                                      .value = scheduleNotifyAndActionController
                                              .currentOpenItemForActionLog
                                              .value ==
                                          index
                                      ? -1
                                      : index;
                                  scheduleNotifyAndActionController
                                      .actionLogModel.result!.data!
                                      .refresh();
                                },
                                isOpenDefault: scheduleNotifyAndActionController
                                        .currentOpenItemForActionLog.value ==
                                    index,
                                header: Text.rich(
                                  TextSpan(
                                    text: '${AppMessagesKey.event.tr}:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: ColorPalette.blueText,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: currentActionData.job == null
                                            ? ""
                                            : ' ${currentActionData.job!.title}',
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
                                              currentActionData.job == null
                                                  ? ""
                                                  : currentActionData
                                                      .job!.jobNumber
                                                      .toString(),
                                          secondTitle:
                                              AppMessagesKey.timestamp.tr,
                                          seconfSubtitle: currentActionData
                                                      .createdAt ==
                                                  null
                                              ? ""
                                              : scheduleNotifyAndActionController
                                                  .formatDate(currentActionData
                                                      .createdAt!),
                                        ),
                                        CommonScheduleRow(
                                          firsTitle:
                                              AppMessagesKey.initiator.tr,
                                          firstSubtitle: currentActionData
                                                      .user ==
                                                  null
                                              ? ""
                                              : '${currentActionData.user!.firstName ?? ""} ${currentActionData.user!.lastName ?? ""}',
                                          secondTitle: AppMessagesKey.action.tr,
                                          seconfSubtitle:
                                              currentActionData.status == null
                                                  ? ""
                                                  : currentActionData
                                                          .status!.name ??
                                                      "",
                                        ),
                                        CommonScheduleRow(
                                          firsTitle:
                                              AppMessagesKey.affectedUser.tr,
                                          firstSubtitle: currentActionData
                                                      .employee ==
                                                  null
                                              ? ""
                                              : '${currentActionData.employee!.employable!.firstName ?? ""} ${currentActionData.employee!.employable!.lastName ?? ""}',
                                          secondTitle:
                                              AppMessagesKey.position.tr,
                                          seconfSubtitle:
                                              currentActionData.skill == null
                                                  ? ""
                                                  : currentActionData
                                                          .skill!.name ??
                                                      "",
                                        ),
                                        CommonScheduleRow(
                                          firsTitle:
                                              AppMessagesKey.callstart.tr,
                                          firstSubtitle: DateFormat(
                                                  "${Utilities.getDateFormat(homeControlller.employeeDetailModel.result!.dateFormat ?? "")} ${homeControlller.employeeDetailModel.result!.timeFormat}")
                                              .format(
                                            DateTime.parse(
                                                currentActionData.start!),
                                          ),
                                          secondTitle:
                                              AppMessagesKey.callend.tr,
                                          seconfSubtitle: DateFormat(
                                                  "${Utilities.getDateFormat(homeControlller.employeeDetailModel.result!.dateFormat ?? "")} ${homeControlller.employeeDetailModel.result!.timeFormat}")
                                              .format(
                                            DateTime.parse(
                                                currentActionData.end!),
                                          ),
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
                            .actionLogisLoading,
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
