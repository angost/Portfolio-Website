// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/contactPage.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/projectsPage.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Home", false),
      body: Center(
          child: Column(
        children: <Widget>[
          Spacer(),
          // ShaderMask(
          //     blendMode: BlendMode.srcIn,
          //     shaderCallback: (bounds) => LinearGradient(colors: [
          //           Colors.pink.shade700,
          //           Color.fromARGB(255, 223, 91, 144),
          //         ]).createShader(
          //           Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          //         ),
          //     child: Text("In progress",
          //         style: Theme.of(context).textTheme.displayLarge)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Expanded(
                  flex: 1, child: Image.asset('assets/images/my_photo2.png')),
              SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 2,
                child: Column(children: <Widget>[
                  Text(
                    "Hello",
                    style: textBodyFancy,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sodales purus ac felis vestibulum, non convallis orci gravida. Nam et diam ac dui maximus laoreet tempus nec justo. Cras sed diam vel libero scelerisque interdum non ut lectus. Pellentesque mattis ex ut sapien tincidunt interdum. Vestibulum ac bibendum arcu. Ut ut dui in dolor pharetra sodales. Suspendisse potenti. Curabitur aliquam elit sed ligula sagittis scelerisque. Duis sodales interdum risus id tempor. Maecenas pulvinar odio ex, eu efficitur nisl convallis a. In eget nisl arcu. Donec facilisis ipsum quis orci mollis interdum sit amet ut libero. Sed eget nunc lectus. Cras vel aliquet nisi."),
                  Text(
                      "Aenean facilisis sapien sapien, eget luctus tellus feugiat eget. Nunc vel pellentesque eros. Duis feugiat dapibus elit sed scelerisque. Curabitur venenatis sollicitudin tempus. Phasellus ut finibus massa, a efficitur augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia volutpat massa at sodales. Duis in neque faucibus, rhoncus justo molestie, consequat neque. Integer fermentum a lacus vitae imperdiet."),
                  Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text(
                      "Check my projects",
                      style: textBodyFancy,
                    ),
                    SizedBox(width: 20),
                    ClipOval(
                        child: Container(
                            color: Color.fromRGBO(201, 116, 149, 0.5),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            ProjectsPage(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              icon: Image.asset(
                                "assets/images/sparkles.png",
                                width: 30,
                                height: 30,
                              ),
                              hoverColor: Color.fromRGBO(201, 116, 149, 0.5),
                              highlightColor: Colors.transparent,
                            )))
                  ]),
                  SizedBox(height: 20),
                  Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Text(
                      "Contact me",
                      style: textBodyFancy,
                    ),
                    SizedBox(width: 20),
                    ClipOval(
                        child: Container(
                            color: Color.fromRGBO(201, 116, 149, 0.5),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            ContactPage(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.work,
                                size: 30,
                                color: Colors.black,
                              ),
                              hoverColor: Color.fromRGBO(201, 116, 149, 0.5),
                              highlightColor: Colors.transparent,
                            )))
                  ]),
                ]),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          Spacer(),
          Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            height: 50,
          )
        ],
      )),
    );
  }
}
