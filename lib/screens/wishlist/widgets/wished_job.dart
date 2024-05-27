import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/controller/wishlist/wishlist_controller.dart';
import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/screens/wishlist/widgets/job_item.dart';
import 'package:call_steward/screens/wishlist/widgets/no_data_found.dart';

class WishedJob extends StatelessWidget {
  const WishedJob({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController =
        Get.find<WishlistController>();
    return Obx(
      () => wishlistController.wishedList.isNotEmpty
          ? ListView.builder(
              itemCount: wishlistController.wishedList.length,
              itemBuilder: (context, index) {
                final wishedJob = wishlistController.wishedList[index];
                return wishedJob.job != null
                    ? JobItem(
                        eventName: wishedJob.job?.title ?? '',
                        dateRange: wishedJob.start == null &&
                                wishedJob.end == null
                            ? ""
                            : " ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(wishedJob.start!)} - ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(wishedJob.end!)}",
                        location: wishedJob.job?.venue?.name ??
                            (wishedJob.job!.venue!.addresses.isNotEmpty
                                ? ",${wishedJob.job?.venue?.addresses.first.address ?? ""}, ${wishedJob.job?.venue?.addresses.first.municipality ?? ""}, ${wishedJob.job?.venue?.addresses.first.postcode ?? ""}, ${wishedJob.job?.venue?.addresses.first.stateProvince ?? ""}, ${wishedJob.job?.venue?.addresses.first.country ?? ""}"
                                : ""),
                        steward:
                            "${wishedJob.job?.employee?.employable?.firstName ?? ""} ${wishedJob.job?.employee?.employable?.lastName ?? ""}",
                        onTap: () {
                          wishlistController
                              .getAndDeleteWishlistJobs(wishedJob.id!);
                        },
                      )
                    : const SizedBox.shrink();
              },
            )
          : const NoDataFound(),
    );
  }
}
