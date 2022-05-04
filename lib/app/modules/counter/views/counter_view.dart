import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  final mycontroller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mycontroller.changecompletion(mycontroller.mycount.value);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                mycontroller.resetcount(mycontroller.mycount.value);
              },
              icon: Icon(Icons.refresh))
        ],
        title: Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            mycontroller.mycount.value.count.toString(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
