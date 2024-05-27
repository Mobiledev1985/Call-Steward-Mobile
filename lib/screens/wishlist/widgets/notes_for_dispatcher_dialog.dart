import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:call_steward/constants/colorpalette.dart';
import 'package:call_steward/controller/wishlist/wishlist_controller.dart';
import 'package:call_steward/localization/app_messages_key.dart';
import 'package:call_steward/widgets/space_vertical.dart';

class NotesForDispatcherDialog extends StatelessWidget {
  final GestureTapCallback onSubmit;
  const NotesForDispatcherDialog({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController =
        Get.find<WishlistController>();
    return Dialog(
      child: IntrinsicHeight(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    AppMessagesKey.notesForDispatcher.tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: TextFormField(
                controller: wishlistController.notesForDispatcherController,
                maxLines: 4,
                decoration: InputDecoration(
                  fillColor: ColorPalette.white,
                  hintText: AppMessagesKey.notesForDispatcher.tr,
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffcccccc), style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffcccccc), style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffcccccc), style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffcccccc), style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.green,
                      ),
                      onPressed: () {
                        Get.back();
                        onSubmit.call();
                      },
                      child: Text(AppMessagesKey.submit.tr))),
            ),
            const SpaceVertical(10),
          ],
        ),
      ),
    );
  }
}
