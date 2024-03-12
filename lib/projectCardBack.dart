import 'package:flutter/material.dart';
import 'package:portfolio_app/projectDetailsPage.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class ProjectCardBack extends Card {
  BuildContext context;
  String description;
  Map<String, dynamic> projectDetails;
  ProjectCardBack(this.context, this.description, this.projectDetails,
      {super.key})
      : super(
          // elevation: 0,
          shadowColor: Colors.transparent,
          color: Color.fromRGBO(250, 242, 250, 1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    description,
                    style: textBodySmall,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            ProjectDetailsPage(projectDetails),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(227, 203, 214, 1),
                      foregroundColor: Color.fromRGBO(201, 116, 149, 0.5),
                      textStyle: textButtons,
                      shadowColor: Colors.transparent),
                  child: Text(
                    "See more",
                    style: textButtons.copyWith(color: Colors.black),
                  ),
                )
              ]),
        );
}
