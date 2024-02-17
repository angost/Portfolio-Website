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
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Flexible(
            child: GridView.extent(
              maxCrossAxisExtent: 300,
              childAspectRatio: (5 / 4),
              padding: EdgeInsets.only(left: 100, right: 100),
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
              children: List.generate(16, (index) {
                return Card(
                  child: Text('Item $index'),
                );
              }),
            ),
          ),
          SizedBox(
            height: 50,
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
