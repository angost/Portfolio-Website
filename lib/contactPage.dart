// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
    Uri cvLink = Uri(scheme: "", host: "", path: "aostrowska.pl/CV.pdf");

    return Scaffold(
      appBar: MyAppBar(context, "Contact", false, windowWidth > windowHeight),
      body: Center(
          child: Column(children: <Widget>[
        Spacer(),
        Text('angelikaostrowska@poczta.onet.pl'),
        SizedBox(height: 40),
        ContactButton("LinkedIn", Icon(Icons.person), linkedinLink),
        SizedBox(height: 40),
        ContactButton("Github", Icon(Icons.code), githubLink),
        SizedBox(height: 40),
        ContactButton("CV", Icon(Icons.edit_document), cvLink),
        Spacer(),
      ])),
    );
  }
}
