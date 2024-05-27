import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/home/home_controller.dart';
import 'package:call_steward/utils/utilities.dart';
import 'package:call_steward/controller/wishlist/wishlist_controller.dart';
import 'package:call_steward/screens/wishlist/widgets/job_item.dart';
import 'package:call_steward/screens/wishlist/widgets/no_data_found.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class ScheduledJob extends StatelessWidget {
  const ScheduledJob({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController =
        Get.find<WishlistController>();
    return Obx(
      () => wishlistController.scheduledJobList.isNotEmpty
          ? ListView.builder(
              itemCount: wishlistController.scheduledJobList.length,
              itemBuilder: (context, index) {
                final scheduledJob = wishlistController.scheduledJobList[index];
                return LongPressDraggable<String>(
                  data: wishlistController.scheduledJobList[index].id,
                  feedback: Material(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          colors: [
                            ColorPalette.white,
                            ColorPalette.gradientColor,
                          ],
                          stops: [
                            0.0,
                            1.0,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(scheduledJob.title ?? ''),
                          const SpaceVertical(4),
                        ],
                      ),
                    ),
                  ),
                  child: JobItem(
                    eventName: scheduledJob.title ?? '',
                    dateRange: scheduledJob.start == null &&
                            scheduledJob.end == null
                        ? ""
                        : " ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(scheduledJob.start!)} - ${DateFormat(Utilities.getDateFormat(Get.find<HomeControlller>().employeeDetailModel.result!.dateFormat!)).format(scheduledJob.end!)}",
                    location: (scheduledJob.venue?.name ?? '') +
                        (scheduledJob.venue!.addresses.isNotEmpty
                            ? ",${scheduledJob.venue?.addresses.first.address}, ${scheduledJob.venue?.addresses.first.municipality}, ${scheduledJob.venue?.addresses.first.postcode}, ${scheduledJob.venue?.addresses.first.stateProvince}, ${scheduledJob.venue?.addresses.first.country}"
                            : ""),
                    steward: scheduledJob.employee == null &&
                            scheduledJob.employee?.employable == null
                        ? ""
                        : "${scheduledJob.employee?.employable?.firstName ?? ""} ${scheduledJob.employee?.employable?.lastName ?? ""}",
                  ),
                );
              })
          : const NoDataFound(),
    );
  }
}
