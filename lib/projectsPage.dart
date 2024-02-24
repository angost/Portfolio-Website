// ignore_for_file: unnecessary_this, prefer_const_constructors, unused_field

// import 'package:flip_card/flip_card_controller.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/projectCardFront.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({super.key});

  List projectsData = <Map<String, String>>[
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
    {'name': 'a', 'description': 'b', 'path': 'assets/images/pixels.png'},
    {'name': 'd', 'description': 'g', 'path': 'assets/images/fish.png'},
  ];

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
                FlipCardController controller = FlipCardController();

                return InkWell(
                  onHover: (isHovering) {
                    controller.toggleCard();
                  },
                  onTap: () {}, // has to be here for onHover to work
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: FlipCard(
                    controller: controller,
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT, // The side to initially display.
                    front: ProjectCardFront(context, widget.projectsData[index]['name'], widget.projectsData[index]['description'], widget.projectsData[index]['path']),
                    back: Card(
                      child: Text(
                        'Description, description, description, lorem ipsum dot sit amet',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
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
