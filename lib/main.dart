import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Application",
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          surface: Color(0xff003909)),
    ),
  ));
}
