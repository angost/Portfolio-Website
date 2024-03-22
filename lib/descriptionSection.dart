import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionSection extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  double windowWidth;
  double paragraphDistance;
  double titleContentDistanceMain;
  double sectionDistanceMain;
  double scrollBarPadding;
  DescriptionSection(
      this.projectDetails,
      this.windowWidth,
      this.paragraphDistance,
      this.titleContentDistanceMain,
      this.sectionDistanceMain,
      this.scrollBarPadding,
      {super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  @override
  Widget build(BuildContext context) {
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

    return Expanded(
        flex: 3,
        child: Container(
            padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
                left: widget.windowWidth / 22,
                right: widget.windowWidth / 22 - widget.scrollBarPadding),
            child: Scrollbar(
              thumbVisibility: true,
              interactive: false,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.only(right: widget.scrollBarPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                          Text("Description:", style: textBodyMediumBold),
                          SizedBox(
                            height: widget.titleContentDistanceMain,
                          )
                        ] +
                        descriptionParts +
                        <Widget>[
                          SizedBox(height: widget.sectionDistanceMain),
                          Text("Takeaways:", style: textBodyMediumBold),
                          Text(
                              " - ${widget.projectDetails['takeaways'].join('\n - ')}",
                              style: textBodySmall)
                        ]),
              ),
            )));
  }
}
