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
            automaticallyImplyLeading: false,
            actions:
                // TODO change navigation behaviour, e.g. create Controller with methods like changeToPage(x) which POPS current page from stack and PUSHES new, requested page. Better, because we won't have many unncessary elements on stack
                Menu(context, currentPage, TextStyle(fontSize: 28)).menuItems,
            // , decoration: TextDecoration.underline
            toolbarHeight: 70);
}
