// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/menuItem.dart';
import 'package:portfolio_app/homePage.dart';
import 'package:portfolio_app/projectsPage.dart';
import 'package:portfolio_app/contactPage.dart';

class Menu {
  BuildContext context;
  String currentPage;
  TextStyle menuTextStyle;
  List<Widget> menuItems = [];

  Menu(this.context, this.currentPage, this.menuTextStyle) {
    this.createMenuItems();
  }

  void createMenuItems() {
    this.menuItems = <Widget>[
      MenuItem(
          "Home", "Home" == currentPage, () => new HomePage(), menuTextStyle),
      SizedBox(width: 10),
      MenuItem("Projects", "Projects" == currentPage, () => new ProjectsPage(),
          menuTextStyle),
      SizedBox(width: 10),
      MenuItem("Contact", "Contact" == currentPage, () => new ContactPage(),
          menuTextStyle),
      SizedBox(width: 10),
    ];
  }
}
