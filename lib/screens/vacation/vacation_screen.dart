import 'package:call_steward/screens/home/app_drawer_screen.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/screens/vacation/widgets/add_vacation_dialog.dart';
import 'package:call_steward/screens/vacation/widgets/edit_vacation_dialog.dart';
import 'package:call_steward/widgets/full_screen_loading_dialog.dart';
import 'package:call_steward/controller/vacation/vacation_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/custom_expansion_pannel.dart';
import 'package:call_steward/screens/my_profile/widgets/policy_button.dart';
import 'package:call_steward/screens/vacation/widgets/delect_vacation_confirmation_dialog.dart';
import 'package:call_steward/widgets/wthite_box_with_border.dart';
import 'package:call_steward/widgets/space_horizontal.dart';
import 'package:call_steward/widgets/space_vertical.dart';

import 'widgets/view_history_dialog.dart';

class VacationScreen extends StatefulWidget {
  const VacationScreen({
    super.key,
  });

  @override
  State<VacationScreen> createState() => _VacationScreenState();
}

class _VacationScreenState extends State<VacationScreen> {
  final VacationController vacationController = Get.put(VacationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppMessagesKey.vacation.tr),
        ),
        drawer: const AppDrawer(),
        body: Obx(
          () {
            return vacationController.initLoading
                ? const Center(
                    child: Loading(
                      color: ColorPalette.blue,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 12),
                            child: CustomExpansionPanel(
                              isOpenDefault: true,
                              header: Text(AppMessagesKey.vacation.tr),
                              body: Column(
                                children: [
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: PolicyButton()),
                                  const SpaceVertical(10),
                                  WhiteBoxWithBorder(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SpaceVertical(10),
                                          Center(
                                            child: SizedBox(
                                              width: 200,
                                              height: 40,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ColorPalette.green),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (context) =>
                                                        const AddVacationDialog(),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.add),
                                                    Text(AppMessagesKey
                                                        .addVacation.tr),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SpaceVertical(10),
                                          const Divider(),
                                          const SpaceVertical(10),
                                          Text(
                                            '${AppMessagesKey.running.tr}:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: ColorPalette.blueText,
                                                ),
                                          ),
                                          const SpaceVertical(6),
                                          vacationController.vacationModel
                                                  .vacations!.running.isEmpty
                                              ? Text(
                                                  AppMessagesKey
                                                      .currentlyAvailable.tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(),
                                                )
                                              : Column(
                                                  children:
                                                      vacationController
                                                          .vacationModel
                                                          .vacations!
                                                          .running
                                                          .map(
                                                            (e) => Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 12,
                                                                ),
                                                                const SpaceHorizontal(
                                                                    4),
                                                                Expanded(
                                                                  child:
                                                                      Text.rich(
                                                                    TextSpan(
                                                                      text:
                                                                          "${e.label}:",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${AppMessagesKey.onLeaveFrom.tr}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall,
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${DateFormat(Utilities.getDateFormat(vacationController.employeeDetailModel.result!.dateFormat ?? "")).format(e.start)}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall!
                                                                              .copyWith(
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${AppMessagesKey.to.tr}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall,
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${DateFormat(Utilities.getDateFormat(vacationController.employeeDetailModel.result!.dateFormat ?? "")).format(e.end)}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall!
                                                                              .copyWith(
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                          .toList(),
                                                ),
                                          const Divider(),
                                          const SpaceVertical(10),
                                          Text(
                                            '${AppMessagesKey.upcoming.tr}:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: ColorPalette.blueText,
                                                ),
                                          ),
                                          const SpaceVertical(6),
                                          vacationController.vacationModel
                                                  .vacations!.upcoming.isEmpty
                                              ? Text(
                                                  AppMessagesKey
                                                      .noUpcomingLeavefound.tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(),
                                                )
                                              : Column(
                                                  children:
                                                      vacationController
                                                          .vacationModel
                                                          .vacations!
                                                          .upcoming
                                                          .map(
                                                            (e) => Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 12,
                                                                ),
                                                                const SpaceHorizontal(
                                                                    4),
                                                                Expanded(
                                                                  child:
                                                                      Text.rich(
                                                                    TextSpan(
                                                                      text:
                                                                          "${e.label}:",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${AppMessagesKey.onLeaveFrom.tr}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall,
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${DateFormat(Utilities.getDateFormat(vacationController.employeeDetailModel.result!.dateFormat ?? "")).format(e.start)}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall!
                                                                              .copyWith(
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${AppMessagesKey.to.tr}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall,
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' ${DateFormat(Utilities.getDateFormat(vacationController.employeeDetailModel.result!.dateFormat ?? "")).format(e.end)}',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall!
                                                                              .copyWith(
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                                const SpaceHorizontal(
                                                                    8),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        barrierDismissible:
                                                                            false,
                                                                        builder:
                                                                            (context) =>
                                                                                EditVacationDialog(vacation: e),
                                                                      );
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      FontAwesomeIcons
                                                                          .pencil,
                                                                      size: 14,
                                                                      color: ColorPalette
                                                                          .blueText,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) =>
                                                                                DeleteVacationConfirmationDialog(
                                                                          onTap:
                                                                              () {
                                                                            showDialog(
                                                                              context: context,
                                                                              barrierDismissible: false,
                                                                              builder: (BuildContext context) {
                                                                                return const FullScreenLoadingDialog(
                                                                                  message: 'Deleting...',
                                                                                );
                                                                              },
                                                                            );
                                                                            Get.find<VacationController>().deleteVacation(e.id);
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      FontAwesomeIcons
                                                                          .trash,
                                                                      size: 14,
                                                                      color: ColorPalette
                                                                          .blueText,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                          .toList(),
                                                ),
                                          const SpaceVertical(20),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const ViewHistoryDialog(),
                                              );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(9),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffBACCDD)),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: ColorPalette.white,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.eye,
                                                    size: 12,
                                                    color: Color(0xff57BCEA),
                                                  ),
                                                  const SpaceHorizontal(5),
                                                  Text(
                                                    AppMessagesKey
                                                        .viewHistory.tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color: ColorPalette
                                                              .blueText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SpaceVertical(10),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
