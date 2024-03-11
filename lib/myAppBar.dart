// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/menu.dart';

class MyAppBar extends AppBar {
  BuildContext context;
  String currentPage;
  bool backArrow;
  MyAppBar(this.context, this.currentPage, this.backArrow, {super.key})
      : super(
            title: Text("Angelika Ostrowska",
                style: Theme.of(context).textTheme.displayMedium),
            automaticallyImplyLeading: backArrow,
            actions: Menu(context, currentPage,
                    Theme.of(context).textTheme.displayMedium!)
                .menuItems,
            // , decoration: TextDecoration.underline
            toolbarHeight: 70,
            scrolledUnderElevation: 0);
}
