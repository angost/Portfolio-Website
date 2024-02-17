// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/menu.dart';

class MyAppBar extends AppBar {
  BuildContext context;
  String currentPage;
  MyAppBar(this.context, this.currentPage)
      : super(
            title: Text("Angelika Ostrowska", style: TextStyle(fontSize: 28)),
            actions:
                Menu(context, currentPage, TextStyle(fontSize: 28)).menuItems,
            // , decoration: TextDecoration.underline
            toolbarHeight: 70);
}
