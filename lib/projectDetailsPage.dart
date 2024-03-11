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
    return Scaffold(
      appBar: MyAppBar(context, "Projects", true), // add back navigation arrow
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor)),
              margin: const EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 40.0, bottom: 40.0),
              child: Column(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    // child: Text(widget.projectDetails['name']),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Container(color: Colors.amber)),
                      Expanded(flex: 3, child: Container(color: Colors.green))
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
