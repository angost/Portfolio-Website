// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

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
