import 'package:flutter/material.dart';
import 'package:app_cep/views/home_page.dart';
import 'package:get/get.dart';
import 'package:app_cep/views/historic_page.dart';

void main() {
  runApp(GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/historic',
          page: () => HistoricPage(),
        ),
      ],
      theme: ThemeData(hintColor: Colors.black),
      debugShowCheckedModeBanner: false,
  ));
}
