// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:portfolio_app/theme/theme_constants.dart';
import 'package:portfolio_app/myAppBar.dart';
import 'package:portfolio_app/contactButton.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    Uri githubLink = Uri(scheme: "", host: "", path: "github.com/angost");
    Uri linkedinLink =
        Uri(scheme: "", host: "", path: "linkedin.com/in/angelikaostrowska");
    Uri cvEnglishLink = Uri(scheme: "", host: "", path: "aostrowska.pl/CV.pdf");
    Uri cvPolishLink =
        Uri(scheme: "", host: "", path: "aostrowska.pl/CV-PL.pdf");

    return Scaffold(
      appBar: MyAppBar(context, "Contact", false, windowWidth > windowHeight),
      body: Center(
          child: Column(children: <Widget>[
        Spacer(),
        SelectableText(
          'angelikaostrowska@poczta.onet.pl',
          style: textBodyMedium,
        ),
        SizedBox(height: 40),
        Row(children: <Widget>[
          Spacer(),
          ContactButton("CV English", Icon(Icons.edit_document), cvEnglishLink),
          SizedBox(
            width: 40,
          ),
          ContactButton("CV Polish", Icon(Icons.edit_document), cvPolishLink),
          Spacer(),
        ]),
        SizedBox(height: 40),
        ContactButton("LinkedIn", Icon(Icons.person), linkedinLink),
        SizedBox(height: 40),
        ContactButton("Github", Icon(Icons.code), githubLink),
        Spacer(),
      ])),
    );
  }
}
