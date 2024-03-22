// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/metaDataSection.dart';
import 'package:portfolio_app/descriptionSection.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class ProjectDetailsPage extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  double paragraphDistance = 7;
  double titleContentDistanceMain = 5;
  double titleContentDistanceMetadata = 3;
  double sectionDistanceMain = 20;
  double sectionDistanceMetadata = 15;
  double scrollBarPadding = 0;

  ProjectDetailsPage(this.projectDetails, {super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    widget.scrollBarPadding = windowWidth / 50;

    return Scaffold(
      appBar: MyAppBar(context, "Projects", true, windowWidth > windowHeight),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: windowWidth / 25,
                  right: windowWidth / 25,
                  top: windowHeight / 20,
                  bottom: windowHeight / 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(250, 250, 250, 1),
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // PROJECT NAME SECTION
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color: Theme.of(context).primaryColor)),
                        ),
                        alignment: AlignmentDirectional.centerStart,
                        padding: EdgeInsets.only(left: 60.0),
                        child: Text(widget.projectDetails['name'],
                            style: textBodyLargeBold),
                      ),
                    ),
                    // PROJECT DETAILS SECTION
                    Expanded(
                      flex: 9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // Metadata section
                          MetaDataSection(
                              widget.projectDetails,
                              widget.titleContentDistanceMetadata,
                              widget.sectionDistanceMetadata),
                          // Description section
                          DescriptionSection(
                            widget.projectDetails,
                            windowWidth,
                            widget.paragraphDistance,
                            widget.titleContentDistanceMain,
                            widget.sectionDistanceMain,
                            widget.scrollBarPadding,
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            height: windowHeight / 15,
          )
        ],
      )),
    );
  }
}
