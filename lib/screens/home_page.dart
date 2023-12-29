import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/screens/search_page.dart';
import '../services/api_service.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Store'),
      ),
      body: Container(),
    );
  }
}
