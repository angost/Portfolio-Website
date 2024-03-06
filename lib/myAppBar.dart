// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/menu.dart';

class MyAppBar extends AppBar {
  BuildContext context;
  String currentPage;
  MyAppBar(this.context, this.currentPage, {super.key})
      : super(
            title: Text("Angelika Ostrowska",
                style: Theme.of(context).textTheme.displayMedium),
            automaticallyImplyLeading: false,
            actions: Menu(context, currentPage,
                    Theme.of(context).textTheme.displayMedium!)
                .menuItems,
            // , decoration: TextDecoration.underline
            toolbarHeight: 70);
}
