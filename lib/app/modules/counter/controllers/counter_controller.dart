import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxcounterapp/app/modules/counter/models/counter_model.dart';
import 'package:getxcounterapp/app/modules/counter/services/remote_services.dart';

class CounterController extends GetxController {
  Rx<Counter> mycount = Counter(count: 0).obs;
  Future<void> fetchcount() async {
    var ncount = await RemoteServices.fetchcount();
    if (ncount != null) {
      mycount.value = ncount;
    }
  }

  Future<void> changecompletion(Counter c) async {
    if (mycount.value.count >= 5) {
      Get.defaultDialog(content: Text('do you want to continue'), actions: [
        TextButton(
            onPressed: () async {
              var mytodo = await RemoteServices.patchcount(c);
              fetchcount();

              Get.back();
            },
            child: Text('yes')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('no'))
      ]);
    } else {
      var mytodo = await RemoteServices.patchcount(c);
      fetchcount();
    }
  }

  Future<void> resetcount(Counter c) async {
    var mytodo = await RemoteServices.resetcount(c);
    fetchcount();
  }
  // void increment() {
  //   if (mycount.value >= 5) {
  //     Get.defaultDialog(content: Text('do you want to continue'), actions: [
  //       TextButton(
  //           onPressed: () {
  //             mycount.value = mycount.value + 1;
  //             Get.back();
  //           },
  //           child: Text('yes')),
  //       TextButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text('no'))
  //     ]);
  //   } else {
  //     mycount.value = mycount.value + 1;
  //   }
  // }

  @override
  void onInit() {
    fetchcount();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
