// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(15),
        hoverColor: Color.fromRGBO(227, 213, 219, 0.5),
        highlightColor: Color.fromRGBO(201, 116, 149, 0.5),
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.only(
              bottom: 0.5, // Space between underline and text
              left: 10,
              right: 10),
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
