import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/api_service.dart';
import 'screens/home_page.dart';
import 'screens/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Online Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
