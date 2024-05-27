import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/controller/wishlist/wishlist_controller.dart';
import 'package:call_steward/screens/wishlist/widgets/job_item.dart';
import 'package:call_steward/screens/wishlist/widgets/no_data_found.dart';

class IgnoredJob extends StatelessWidget {
  const IgnoredJob({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController =
        Get.find<WishlistController>();
    return Obx(
      () => wishlistController.ignoredJobList.isNotEmpty
          ? ListView.builder(
              itemCount: wishlistController.ignoredJobList.length,
              itemBuilder: (context, index) {
                final ignoredJob = wishlistController.ignoredJobList[index];

                return ignoredJob.job != null
                    ? JobItem(
                        eventName: ignoredJob.job?.title ?? '',
                        dateRange: ignoredJob.start == null &&
                                ignoredJob.end == null
                            ? ""
                            : " ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(ignoredJob.start!)} - ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(ignoredJob.end!)}",
                        location: (ignoredJob.job?.venue?.name ?? '') +
                            (ignoredJob.job!.venue!.addresses.isNotEmpty
                                ? ",${ignoredJob.job?.venue?.addresses.first.address}, ${ignoredJob.job?.venue?.addresses.first.municipality}, ${ignoredJob.job?.venue?.addresses.first.postcode}, ${ignoredJob.job?.venue?.addresses.first.stateProvince}, ${ignoredJob.job?.venue?.addresses.first.country}"
                                : ""),
                        steward: ignoredJob.job?.employee == null &&
                                ignoredJob.job?.employee?.employable == null
                            ? ""
                            : "${ignoredJob.job?.employee?.employable?.firstName ?? ""} ${ignoredJob.job?.employee?.employable?.lastName ?? ""}",
                        onTap: () {
                          wishlistController
                              .getAndDeleteIgnoredJobs(ignoredJob.id!);
                        },
                      )
                    : const SizedBox.shrink();
              })
          : const NoDataFound(),
    );
  }
}
