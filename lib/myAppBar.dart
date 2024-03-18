// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/menu.dart';
import 'package:portfolio_app/homePage.dart';
import 'package:portfolio_app/projectsPage.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class MyAppBar extends AppBar {
  BuildContext context;
  String currentPage;
  bool backArrow;
  MyAppBar(this.context, this.currentPage, this.backArrow, {super.key})
      : super(
            title: TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => HomePage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              ),
              child: Text("Angelika Ostrowska",
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            automaticallyImplyLeading: backArrow,
            leading: backArrow == true
                ? IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    hoverColor: Color.fromRGBO(227, 213, 219, 0.5),
                    highlightColor: Color.fromRGBO(201, 116, 149, 0.5),
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ProjectsPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        ))
                : null,
            actions: Menu(context, currentPage,
                    Theme.of(context).textTheme.displayMedium!)
                .menuItems,
            toolbarHeight: 70,
            scrolledUnderElevation: 0);
}
