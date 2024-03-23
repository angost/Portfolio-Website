import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionSection extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  bool isViewHorizontal;
  double windowWidth;
  double paragraphDistance = 7;
  double titleContentDistanceMain = 5;
  double sectionDistanceMain = 20;
  double scrollBarPadding = 0;
  DescriptionSection(
      this.projectDetails, this.isViewHorizontal, this.windowWidth,
      {super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  @override
  Widget build(BuildContext context) {
    widget.scrollBarPadding = widget.windowWidth / 50;

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

    Column mainContent = Column(
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
              Text(" - ${widget.projectDetails['takeaways'].join('\n - ')}",
                  style: textBodySmall)
            ]);

    return Container(
        padding: EdgeInsets.only(
            top: widget.isViewHorizontal ? 30 : 20,
            bottom: 30,
            left: widget.isViewHorizontal
                ? widget.windowWidth / 22
                : widget.windowWidth / 25,
            right: widget.windowWidth / 22 - widget.scrollBarPadding),
        child: widget.isViewHorizontal
            ? Scrollbar(
                thumbVisibility: true,
                interactive: false,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.only(right: widget.scrollBarPadding),
                  child: mainContent,
                ),
              )
            : mainContent);
  }
}
