import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navigation_controller.dart';
import '../utils.dart';

class Header extends StatelessWidget {
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "F-Drive",
            style: textStyle(28, textColor, FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(10, 10),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(-10, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            //  Without wrapping my Row widget inside "Obx" I would
            //  not be able to achieve desired response of reactive
            //  changing of tab.
            child: Obx(
              () => Row(
                children: [
                  InkWell(
                      onTap: () => navController.changeTab("Storage"),
                      child: tabCell("Storage",
                          navController.tab.value == "Storage", context)),
                  InkWell(
                      onTap: () => navController.changeTab("Files"),
                      child: tabCell("Files",
                          navController.tab.value == "Files", context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Bcz of getx without changing my whole app UI, I
  //  can simply implement the following one as:
  NavigationController navController = Get.put(NavigationController());

  Widget tabCell(String text, bool selected, BuildContext context) {
    return selected
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45 - 5,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(10, 10),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: textStyle(23, Colors.white, FontWeight.bold),
                ),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.45 - 10,
            height: 60,
            child: Center(
              child: Text(
                text,
                style: textStyle(23, textColor, FontWeight.bold),
              ),
            ),
          );
  }
}
