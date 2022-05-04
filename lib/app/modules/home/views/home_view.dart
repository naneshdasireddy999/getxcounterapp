import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxcounterapp/app/modules/counter/views/counter_view.dart';
import 'package:getxcounterapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.COUNTER);
              },
              child: Text('go to counter page'))),
    );
  }
}
