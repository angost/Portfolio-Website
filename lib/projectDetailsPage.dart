// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectDetailsPage extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  double paragraphDistance = 7;
  double titleContentDistanceMain = 5;
  double titleContentDistanceMetadata = 3;
  double sectionDistanceMain = 20;
  double sectionDistanceMetadata = 15;

  double scrollBarPadding = 30;

  ProjectDetailsPage(this.projectDetails, {super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> imgPaths =
        List<String>.from(widget.projectDetails['img_paths'] as List);

    List<String> descriptionParagraphs =
        widget.projectDetails['description_long'].split('\n');
    List<Widget> descriptionParts = <Widget>[];
    for (var paragraph in descriptionParagraphs) {
      descriptionParts.add(Text(paragraph, style: textBodySmall));
      descriptionParts.add(SizedBox(
        height: widget.paragraphDistance,
      ));
    }
    descriptionParts.removeLast();

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, left: 25.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Technologies:",
                                                  style: textBodyMediumBold),
                                              SizedBox(
                                                  height: widget
                                                      .titleContentDistanceMetadata),
                                              Text(
                                                  widget.projectDetails[
                                                          'technologies']
                                                      .join(", "),
                                                  style: textBodySmall),
                                              SizedBox(
                                                  height: widget
                                                      .sectionDistanceMetadata),
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'Creators: ',
                                                        style:
                                                            textBodyMediumBold),
                                                    TextSpan(
                                                        text: widget
                                                                .projectDetails[
                                                            'people_no'],
                                                        style: textBodySmall),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height: widget
                                                      .sectionDistanceMetadata),
                                              RichText(
                                                text: TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: 'Goal: ',
                                                        style:
                                                            textBodyMediumBold),
                                                    TextSpan(
                                                        text: widget
                                                                .projectDetails[
                                                            'goal'],
                                                        style: textBodySmall),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height: widget
                                                      .sectionDistanceMetadata),
                                              Text("Github:",
                                                  style: textBodyMediumBold),
                                              SizedBox(
                                                  height: widget
                                                      .titleContentDistanceMetadata),
                                              Text(
                                                  "https:/github.com/projectApp",
                                                  style: textBodySmall),
                                            ],
                                          )),
                                      SizedBox(height: 20.0),
                                      Expanded(
                                        child: CarouselSlider(
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              autoPlayInterval:
                                                  Duration(seconds: 4),
                                              viewportFraction: 1.0,
                                              enlargeCenterPage: false,
                                            ),
                                            items: imgPaths.map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Image.asset(
                                                        i,
                                                      ));
                                                },
                                              );
                                            }).toList()),
                                      ),
                                    ],
                                  ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 30,
                                      bottom: 30,
                                      left: 70,
                                      right: 70 - widget.scrollBarPadding),
                                  child: Scrollbar(
                                    thumbVisibility: true,
                                    interactive: false,
                                    child: SingleChildScrollView(
                                      physics: ScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          right: widget.scrollBarPadding),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                                Text("Description:",
                                                    style: textBodyMediumBold),
                                                SizedBox(
                                                  height: widget
                                                      .titleContentDistanceMain,
                                                )
                                              ] +
                                              descriptionParts +
                                              <Widget>[
                                                SizedBox(
                                                    height: widget
                                                        .sectionDistanceMain),
                                                Text("Takeaways:",
                                                    style: textBodyMediumBold),
                                                Text(
                                                    " - ${widget.projectDetails['takeaways'].join('\n - ')}",
                                                    style: textBodySmall)
                                              ]),
                                    ),
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
