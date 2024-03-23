import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class MetaDataSection extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  bool isViewHorizontal;
  double windowWidth;
  double titleContentDistanceMetadata = 3;
  double sectionDistanceMetadata = 15;
  MetaDataSection(this.projectDetails, this.isViewHorizontal, this.windowWidth,
      {super.key});

  @override
  State<MetaDataSection> createState() => _MetaDataSectionState();
}

class _MetaDataSectionState extends State<MetaDataSection> {
  @override
  Widget build(BuildContext context) {
    String githubLinkText = widget.projectDetails['github_link'];
    Uri githubLink = Uri(scheme: "", host: "", path: githubLinkText);

    List<String> imgPaths =
        List<String>.from(widget.projectDetails['img_paths'] as List);

    CarouselSlider imagesSlider = CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ),
        items: imgPaths.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    i,
                  ));
            },
          );
        }).toList());

    List<Widget> mainContent = <Widget>[
      Text("Technologies:", style: textBodyMediumBold),
      SizedBox(
          height:
              widget.isViewHorizontal ? widget.titleContentDistanceMetadata : 0,
          width: widget.isViewHorizontal
              ? 0
              : widget.titleContentDistanceMetadata),
      Text(widget.projectDetails['technologies'].join(", "),
          style: textBodySmall),
      SizedBox(
          height: widget.isViewHorizontal ? widget.sectionDistanceMetadata : 0,
          width: widget.isViewHorizontal ? 0 : widget.sectionDistanceMetadata),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Creators: ', style: textBodyMediumBold),
            TextSpan(
                text: widget.projectDetails['people_no'], style: textBodySmall),
          ],
        ),
      ),
      SizedBox(
          height: widget.isViewHorizontal ? widget.sectionDistanceMetadata : 0,
          width: widget.isViewHorizontal ? 0 : widget.sectionDistanceMetadata),
      RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Goal: ', style: textBodyMediumBold),
            TextSpan(text: widget.projectDetails['goal'], style: textBodySmall),
          ],
        ),
      ),
      SizedBox(
          height: widget.isViewHorizontal ? widget.sectionDistanceMetadata : 0,
          width: widget.isViewHorizontal ? 0 : widget.sectionDistanceMetadata),
      Text("Github:", style: textBodyMediumBold),
      SizedBox(
          height:
              widget.isViewHorizontal ? widget.titleContentDistanceMetadata : 0,
          width: widget.isViewHorizontal
              ? 0
              : widget.titleContentDistanceMetadata),
      githubLinkText != ""
          ? InkWell(
              child: Text(githubLinkText, style: textBodySmall),
              onTap: () {
                launchUrl(githubLink);
              })
          : const Text("-"),
    ];

    return widget.isViewHorizontal
        // MetaDataSection is a Column on the left of the screen, if orientation is horizontal
        ? Container(
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 30, left: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: mainContent,
                    )),
                SizedBox(
                  height: widget.isViewHorizontal ? 20.0 : 0,
                  width: widget.isViewHorizontal ? 0 : 20.0,
                ),
                Expanded(
                  child: imagesSlider,
                ),
              ],
            ))
        // if orientation is vertical, MetaDataSection becomes a Row between Name and DescriptionSection
        : Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor)),
            ),
            padding: EdgeInsets.only(left: widget.windowWidth / 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                          const SizedBox(
                            height: 5,
                          )
                        ] +
                        mainContent +
                        <Widget>[
                          const SizedBox(
                            height: 5,
                          )
                        ],
                  ),
                ),
                SizedBox(
                  height: widget.isViewHorizontal ? 20.0 : 0,
                  width: widget.isViewHorizontal ? 0 : 5.0,
                ),
                Expanded(
                  flex: 2,
                  child: imagesSlider,
                ),
              ],
            ));
  }
}
