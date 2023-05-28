import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navigation_controller.dart';
import '../screens/files_screen.dart';
import '../widgets/header.dart';
import './storage_screen.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Header(),
          Obx(
            // StorageScreen(),
            //  Instead of showing same screen every single time like i'm
            //  doing above, now I want to change the screen whenever user
            //  select any of the given tab. Therefore; I remove above line
            //  of code with the one below:
            () => Get.find<NavigationController>().tab.value == 'Storage'
                ? const StorageScreen()
                : const FilesScreen(),
            //  Till folder 4 everything completed.
          ),
        ],
      ),
    );
  }
}
