// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';

class ProjectDetailsPage extends StatefulWidget {
  Map<String, dynamic> projectDetails;

  ProjectDetailsPage(this.projectDetails, {super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double baseBorderRadius = 10.0;
    double baseBorderWidth = 3.0;

    BoxDecoration createBoxDec(
        double topLeftRadius,
        double topRightRadius,
        double bottomLeftRadius,
        double bottomRightRadius,
        double topWidth,
        double bottomWidth,
        double leftWidth,
        double rightWidth) {
      return BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius)),
          color: Colors.white,
          border:
              // Border.all(width: 3, color: Theme.of(context).primaryColor))
              Border(
                  top: BorderSide(
                      width: topWidth, color: Theme.of(context).primaryColor),
                  bottom: BorderSide(
                      width: bottomWidth,
                      color: Theme.of(context).primaryColor),
                  left: BorderSide(
                      width: leftWidth, color: Theme.of(context).primaryColor),
                  right: BorderSide(
                      width: rightWidth,
                      color: Theme.of(context).primaryColor)));
    }

    return Scaffold(
      appBar: MyAppBar(context, "Projects", true), // add back navigation arrow
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 40.0, bottom: 40.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: createBoxDec(
                            baseBorderRadius,
                            baseBorderRadius,
                            0,
                            0,
                            baseBorderWidth,
                            baseBorderWidth / 2,
                            baseBorderWidth,
                            baseBorderWidth),
                        child: Text(widget.projectDetails['name']),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container(
                                  decoration: createBoxDec(
                                      0,
                                      0,
                                      baseBorderRadius,
                                      0,
                                      baseBorderWidth / 2,
                                      baseBorderWidth,
                                      baseBorderWidth,
                                      baseBorderWidth / 2),
                                  child: Text(widget
                                      .projectDetails['technologies'][0]))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  decoration: createBoxDec(
                                      0,
                                      0,
                                      0,
                                      baseBorderRadius,
                                      baseBorderWidth / 2,
                                      baseBorderWidth,
                                      baseBorderWidth / 2,
                                      baseBorderWidth),
                                  child: Text(widget
                                      .projectDetails['description_long'])))
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            height: 50,
          )
        ],
      )),
    );
  }
}
