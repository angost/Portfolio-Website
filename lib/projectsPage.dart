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

  // List projectsData = <Map<String, String>>[
  //   {
  //     'name': 'Flood fill in Assembly',
  //     'description':
  //         'Modify raster image by coloring an area. Made in Assembly for RISC-V.',
  //     'path': 'assets/images/pixels.png'
  //   },
  //   {
  //     'name': 'Matches for Couples',
  //     'description':
  //         'Tool to find activities suitable for both people in a Tinder-like manner.',
  //     'path': 'assets/images/matches.png'
  //   },
  //   {
  //     'name': 'Fish Simulation',
  //     'description':
  //         'Simulation of swimming and preying behaviour depending on fish speed, size, hunger.',
  //     'path': 'assets/images/fish.png'
  //   },
  //   {
  //     'name': 'Vehicle Renting',
  //     'description':
  //         'Command line app in C++ for renting city Bikes and Scooters. With updating progress file system.',
  //     'path': 'assets/images/menu.png'
  //   },
  //   {
  //     'name': 'Tents and Trees puzzle',
  //     'description':
  //         'Recreation of a logical puzzle game with board generation and user interaction. ',
  //     'path': 'assets/images/namioty_i_drzewa.png'
  //   },
  //   {
  //     'name': 'Aplikacja hotele PAP',
  //     'description':
  //         'Desktop application in Java, Swing, for renting rooms in hotels.',
  //     'path': 'assets/images/pap_hotels.png'
  //   },
  //   {
  //     'name': 'Biletomat PIPR w konsoli',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/ticket_machine.jpg'
  //   },
  //   {
  //     'name': 'Figma pap, ta strona, inne',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/figma.png'
  //   },
  //   {
  //     'name': 'Śmietnik zespołowy',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/turn_waste.jpg'
  //   },
  //   {
  //     'name': 'Flutter Portfolio Website',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/flutter.png'
  //   },
  //   {
  //     'name': 'Flutter koło Smart City',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/smart_city_app.png'
  //   },
  //   {
  //     'name': 'AIDSy implementacja algorytmów',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/aisdi.png'
  //   },
  //   {
  //     'name': 'Alpha blending Assembly x86',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/x86.png'
  //   },
  //   {
  //     'name': 'Laby WSI',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/wsi.png'
  //   },
  //   {
  //     'name': 'Laby SOI',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/soi.png'
  //   },
  //   {
  //     'name': 'Project Title',
  //     'description':
  //         'Description, description, description, lorem ipsum dot sit amet',
  //     'path': 'assets/images/empty.png'
  //   },
  // ];

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
    return Scaffold(
      appBar: MyAppBar(context, "Projects"),
      body: Center(
          child: Column(
        children: <Widget>[
          Flexible(
            child: GridView.extent(
              maxCrossAxisExtent: 300,
              childAspectRatio: (5 / 4),
              padding: EdgeInsets.only(top: 20, left: 100, right: 100),
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
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
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT, // The side to initially display.
                    front: ProjectCardFront(
                        context,
                        projectsData[index]['name'],
                        projectsData[index]['img_paths'][0]),
                    // 'assets/images/x86.png'),
                    back: ProjectCardBack(
                        context, projectsData[index]['description_short']),
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
            height: 50,
          )
        ],
      )),
    );
  }
}
