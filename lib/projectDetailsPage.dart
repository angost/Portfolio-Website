// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

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
              margin: const EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 40.0, bottom: 40.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(250, 250, 250, 1),
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color: Theme.of(context).primaryColor)),
                        ),
                        child: Text(widget.projectDetails['name'],
                            style: textBodyLargeBold),
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
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 3,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Technologies:",
                                          style: textBodyMediumBold),
                                      Text(
                                          widget.projectDetails['technologies']
                                              .join(", \n"),
                                          style: textBodySmall),
                                      Text("People no:",
                                          style: textBodyMediumBold),
                                      Text(widget.projectDetails['people_no'],
                                          style: textBodySmall),
                                      Text("Goal:", style: textBodyMediumBold),
                                      Text(widget.projectDetails['goal'],
                                          style: textBodySmall),
                                      Text("Github link:",
                                          style: textBodyMediumBold),
                                      Text("https:/github.com/projectApp",
                                          style: textBodySmall),
                                    ],
                                  ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: Column(
                                children: <Widget>[
                                  Text("Description:",
                                      style: textBodyMediumBold),
                                  Text(
                                      widget.projectDetails['description_long'],
                                      style: textBodySmall),
                                  Text("Takeaways:", style: textBodyMediumBold),
                                  Text(
                                      " - " +
                                          widget.projectDetails['takeaways']
                                              .join('\n - '),
                                      style: textBodySmall)
                                ],
                              ))),
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
