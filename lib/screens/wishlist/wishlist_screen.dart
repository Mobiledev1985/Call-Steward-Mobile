import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/screens/wishlist/widgets/notes_for_dispatcher_dialog.dart';
import 'package:call_steward/controller/wishlist/wishlist_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/screens/wishlist/widgets/ignored_job.dart';
import 'package:call_steward/screens/wishlist/widgets/scheduled_job.dart';
import 'package:call_steward/screens/wishlist/widgets/wished_job.dart';
import 'package:call_steward/widgets/custom_switch.dart';
import 'package:call_steward/widgets/loading.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/screens/home/app_drawer_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wishlistController.getInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Text(AppMessagesKey.wishlist.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 20.0, right: 12.0),
          child: Obx(
            () => wishlistController.employeeDetailsIsLoading
                ? const Center(
                    child: Loading(
                      color: ColorPalette.blue,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () {
                          return CustomSwitch(
                            title: '',
                            isActive: wishlistController.dailyStandBy,
                            onChanged: (value) {
                              wishlistController
                                  .updateMyAvailibility(value ? 1 : 0);
                            },
                          );
                        },
                      ),
                      Text(
                        AppMessagesKey.dailyStandby.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold, height: 2.0),
                      ),
                      const SpaceVertical(6),
                      Text(
                        AppMessagesKey.dailyStandbyDescriprion.tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorPalette.blackText,
                            ),
                      ),
                      const SpaceVertical(20),
                      Text(
                        AppMessagesKey.wishlist.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold, height: 2.0),
                      ),
                      const SpaceVertical(6),
                      Text(
                        AppMessagesKey.wishlistInstructions.tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorPalette.blackText,
                            ),
                      ),
                      const SpaceVertical(20),
                      Row(
                        children: [
                          Expanded(
                            child: DragTarget<String>(
                              builder: (context, candidateData, rejectedData) =>
                                  InkWell(
                                onTap: () {
                                  wishlistController.selectedTabIndex = 0;
                                  wishlistController.getScheduledJobs();
                                },
                                child: Obx(
                                  () {
                                    return Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: wishlistController
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
                                          AppMessagesKey.scheduledJob.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: wishlistController
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
                          ),
                          Expanded(
                            child: DragTarget<String>(
                              builder: (context, candidateData, rejectedData) =>
                                  InkWell(
                                onTap: () {
                                  wishlistController.selectedTabIndex = 1;
                                  wishlistController.getAndDeleteWishlistJobs();
                                },
                                child: Obx(
                                  () {
                                    return Container(
                                      height: 60,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        color: wishlistController
                                                    .selectedTabIndex ==
                                                1
                                            ? ColorPalette.orange
                                            : ColorPalette.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppMessagesKey.wishedJob.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: wishlistController
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
                              onAccept: (data) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      NotesForDispatcherDialog(onSubmit: () {
                                    wishlistController
                                        .onDropScheduleJobToWishedJob(
                                            data.toString());
                                  }),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: DragTarget<String>(
                              builder: (context, candidateData, rejectedData) =>
                                  InkWell(
                                onTap: () {
                                  wishlistController.selectedTabIndex = 2;
                                  wishlistController.getAndDeleteIgnoredJobs();
                                },
                                child: Obx(
                                  () {
                                    return Container(
                                      height: 60,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        color: wishlistController
                                                    .selectedTabIndex ==
                                                2
                                            ? ColorPalette.orange
                                            : ColorPalette.white,
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppMessagesKey.ignoredJob.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: wishlistController
                                                            .selectedTabIndex ==
                                                        2
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
                              onAccept: (data) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      NotesForDispatcherDialog(
                                    onSubmit: () {
                                      wishlistController
                                          .onDropScheduleJobToIgnoredJob(
                                        data.toString(),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: Obx(() => wishlistController.isLoading
                              ? const SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
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
                                )
                              : wishlistController.selectedTabIndex == 0
                                  ? const ScheduledJob()
                                  : wishlistController.selectedTabIndex == 1
                                      ? const WishedJob()
                                      : const IgnoredJob()))
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
