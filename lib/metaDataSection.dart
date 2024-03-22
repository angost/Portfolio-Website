import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class MetaDataSection extends StatefulWidget {
  Map<String, dynamic> projectDetails;
  double titleContentDistanceMetadata;
  double sectionDistanceMetadata;
  MetaDataSection(this.projectDetails, this.titleContentDistanceMetadata,
      this.sectionDistanceMetadata,
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

    return Expanded(
        flex: 1,
        child: Container(
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
                      children: <Widget>[
                        Text("Technologies:", style: textBodyMediumBold),
                        SizedBox(height: widget.titleContentDistanceMetadata),
                        Text(widget.projectDetails['technologies'].join(", "),
                            style: textBodySmall),
                        SizedBox(height: widget.sectionDistanceMetadata),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Creators: ',
                                  style: textBodyMediumBold),
                              TextSpan(
                                  text: widget.projectDetails['people_no'],
                                  style: textBodySmall),
                            ],
                          ),
                        ),
                        SizedBox(height: widget.sectionDistanceMetadata),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Goal: ', style: textBodyMediumBold),
                              TextSpan(
                                  text: widget.projectDetails['goal'],
                                  style: textBodySmall),
                            ],
                          ),
                        ),
                        SizedBox(height: widget.sectionDistanceMetadata),
                        Text("Github:", style: textBodyMediumBold),
                        SizedBox(height: widget.titleContentDistanceMetadata),
                        githubLinkText != ""
                            ? InkWell(
                                child:
                                    Text(githubLinkText, style: textBodySmall),
                                onTap: () {
                                  launchUrl(githubLink);
                                })
                            : const Text("-"),
                      ],
                    )),
                const SizedBox(height: 20.0),
                Expanded(
                  child: CarouselSlider(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Image.asset(
                                  i,
                                ));
                          },
                        );
                      }).toList()),
                ),
              ],
            )));
  }
}
