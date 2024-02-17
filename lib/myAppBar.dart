// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/homePage.dart';

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
      MenuItem("Projects", "Projects" == currentPage, () => new HomePage(),
          menuTextStyle),
      SizedBox(width: 10),
      MenuItem("Contact", "Contact" == currentPage, () => new HomePage(),
          menuTextStyle),
      SizedBox(width: 10),
    ];
  }
}

class MenuItem extends StatefulWidget {
  String text;
  bool isActive;
  Function pageOpener;
  TextStyle menuTextStyle;
  MenuItem(this.text, this.isActive, this.pageOpener, this.menuTextStyle,
      {super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.pageOpener()));
        },
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 0.5, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: widget.isActive ? Colors.black : Colors.white,
            width: 2.0, // Underline thickness
          ))),
          child: Text(
            widget.text,
            style: widget.menuTextStyle,
          ),
        ));
  }
}
