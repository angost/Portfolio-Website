// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectDetailsPage extends StatefulWidget {
  Map<String, dynamic> projectDetails;

  ProjectDetailsPage(this.projectDetails, {super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> imgPaths =
        List<String>.from(widget.projectDetails['img_paths'] as List);

    return Scaffold(
      appBar: MyAppBar(context, "Projects", true), // add back navigation arrow
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 40.0, bottom: 40.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(250, 250, 250, 1),
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                    Expanded(
                      flex: 9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 3,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0),
                                      Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Technologies:",
                                                  style: textBodyMediumBold),
                                              Text(
                                                  widget.projectDetails[
                                                          'technologies']
                                                      .join(", \n"),
                                                  style: textBodySmall),
                                              Text("People no:",
                                                  style: textBodyMediumBold),
                                              Text(
                                                  widget.projectDetails[
                                                      'people_no'],
                                                  style: textBodySmall),
                                              Text("Goal:",
                                                  style: textBodyMediumBold),
                                              Text(
                                                  widget.projectDetails['goal'],
                                                  style: textBodySmall),
                                              Text("Github link:",
                                                  style: textBodyMediumBold),
                                              Text(
                                                  "https:/github.com/projectApp",
                                                  style: textBodySmall),
                                            ],
                                          )),
                                      SizedBox(height: 20.0),
                                      CarouselSlider(
                                          options: CarouselOptions(
                                              autoPlay: true,
                                              autoPlayInterval:
                                                  Duration(seconds: 4)),
                                          items: imgPaths.map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Image.asset(i));
                                              },
                                            );
                                          }).toList()),
                                    ],
                                  ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  padding: EdgeInsets.all(30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Description:",
                                          style: textBodyMediumBold),
                                      Text(
                                          widget.projectDetails[
                                              'description_long'],
                                          style: textBodySmall),
                                      SizedBox(height: 20.0),
                                      Text("Takeaways:",
                                          style: textBodyMediumBold),
                                      Text(
                                          " - ${widget.projectDetails['takeaways'].join('\n - ')}",
                                          style: textBodySmall)
                                    ],
                                  ))),
                        ],
                      ),
                    )
                  ]),
            ),
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
