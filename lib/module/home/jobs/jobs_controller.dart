import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TextEditingController searchController;
  late TabController tabController;
  var radius = const Radius.circular(8.0).obs;
  var radiusSecond = const Radius.circular(0.0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 0) {
        radius.value = const Radius.circular(8.0);
      } else {
        radius.value = const Radius.circular(0.0);
      }
      if (tabController.index == 1) {
        radiusSecond.value = const Radius.circular(8.0);
      } else {
        radiusSecond.value = const Radius.circular(0.0);
      }
      super.onInit();
    });
  }
}
