import 'package:get/get.dart';

class NavigationController extends GetxController {
  //  Here, I'm using RxString it is an responsive string
  RxString tab = "Storage".obs;

  changeTab(String givenTab) {
    tab.value = givenTab;
  }
}
