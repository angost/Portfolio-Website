// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/homePageButton.dart';
import 'package:portfolio_app/contactPage.dart';
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
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    Widget myImage = Image.asset('assets/images/my_photo2.png');
    Widget welcomeText = Text(
      "Hello",
      style: textBodyFancy,
    );
    List<Widget> aboutMeText = <Widget>[
      Text(
          "I am a 2nd year Computer Science student at Warsaw University of Technology, I am active, abitious and dedicated."),
      SizedBox(height: 15),
      Text(
          "During my studies I have learnt a lot and completed many projects, either group or solo, for university assigments or personal use. I get very passionate about them, ready to put my time and effort into creating them."),
      SizedBox(height: 15),
      Text(
          "Summer internship is something I am currently looking for, an opportunity to showcase my skills in an interesting job."),
    ];
    List<Widget> actionButtons = <Widget>[
      HomePageButton(
          "Check my projects",
          Image.asset(
            "assets/images/sparkles.png",
            width: 30,
            height: 30,
          ),
          () => ProjectsPage()),
      SizedBox(height: 30),
      HomePageButton(
          "Contact me",
          Icon(
            Icons.work,
            size: 30,
            color: Colors.black,
          ),
          () => ContactPage())
    ];

    if (windowWidth > windowHeight) {
      // HORIZONTAL MODE
      return Scaffold(
        appBar: MyAppBar(context, "Home", false, true),
        body: Center(
            child: Column(
          children: <Widget>[
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 50,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                        children: <Widget>[welcomeText, SizedBox(height: 20)] +
                            aboutMeText +
                            <Widget>[
                              SizedBox(height: 30),
                            ] +
                            actionButtons)),
                SizedBox(
                  width: 50,
                ),
                Expanded(flex: 1, child: myImage),
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
    } else {
      // VERTICAL MODE
      return Scaffold(
        appBar: MyAppBar(context, "Home", false, false),
        body: Center(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 70, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: welcomeText,
                        )),
                    Expanded(flex: 3, child: myImage)
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: aboutMeText,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: actionButtons,
              ),
            ],
          ),
        )),
      );
    }
  }
}
