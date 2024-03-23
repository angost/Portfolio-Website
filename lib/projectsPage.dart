// ignore_for_file: unnecessary_this, prefer_const_constructors, unused_field

// import 'package:flip_card/flip_card_controller.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/projectCardFront.dart';
import 'package:portfolio_app/projectCardBack.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  // late var projectsData;
  var projectsData = [];
  // bool dataReady = false;

  Future<void> readJson() async {
    final String dataJson =
        await rootBundle.loadString('assets/projectsData.json');
    projectsData = await json.decode(dataJson)['projects'];
    setState(() {
      // dataReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    bool isViewHorizontal = windowWidth > windowHeight;

    return Scaffold(
      appBar: MyAppBar(context, "Projects", false, windowWidth > windowHeight),
      body: Center(
          child: Column(
        children: <Widget>[
          Flexible(
            child: GridView.extent(
              maxCrossAxisExtent: 400,
              childAspectRatio: (5 / 4),
              padding: EdgeInsets.only(
                  top: 20, left: windowWidth / 15, right: windowWidth / 15),
              mainAxisSpacing: windowHeight / 36,
              crossAxisSpacing: windowWidth / 38,
              children: List.generate(projectsData.length, (index) {
                FlipCardController controller = FlipCardController();

                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onExit: (PointerEvent _) async {
                    await Future.delayed(const Duration(seconds: 1));
                    if (!controller.state!.isFront) {
                      controller.toggleCard();
                    }
                  },
                  child: FlipCard(
                    controller: controller,
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,
                    side: CardSide.FRONT,
                    front: ProjectCardFront(
                        context,
                        projectsData[index]['name'],
                        projectsData[index]['img_paths'][0]),
                    back: ProjectCardBack(
                        context,
                        projectsData[index]['description_short'],
                        projectsData[index]),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            height: isViewHorizontal ? windowHeight / 15 : 0,
          )
        ],
      )),
    );
  }
}
