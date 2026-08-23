import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/pending.dart';
import 'package:delivery_app/view/screen/orders/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenController extends GetxController {
  int currentpage = 0;
  List<Widget> listpage = [
    Pending(),
    Accepted(),
    Setting(),
  ];

  List titlepage = ["Pending","Acceptd","Setting"];

  List iconpage = [Icons.pending_actions_outlined, Icons.done_outline_outlined ,Icons.settings_outlined];
  changepage(int current) {
    currentpage = current;
    update();
  }
}
