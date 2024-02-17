// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/myAppBar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Projects"),
      body:
          // Center(
          //     child: Column(
          //   children: <Widget>[
          //     Spacer(),
          GridView.extent(
        maxCrossAxisExtent: 150,
        childAspectRatio: (150 / 120),
        children: List.generate(16, (index) {
          return Card(
            child: Text('Item $index'),
          );
        }),
      ),
      //   Spacer(),
      //   Container(
      //     color: Color.fromRGBO(217, 217, 217, 1),
      //     height: 50,
      //   )
      // ],
      // )
      // ),
    );
  }
}
