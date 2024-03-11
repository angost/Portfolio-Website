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
        child: Text(widget.projectDetails['name']),
      ),
    );
  }
}
