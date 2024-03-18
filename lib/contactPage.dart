// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_app/myAppBar.dart';

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

    return Scaffold(
      appBar: MyAppBar(context, "Contact", false, windowWidth > windowHeight),
      body: Center(
          child: Column(children: <Widget>[
        Spacer(),
        Text('angelikaostrowska@poczta.onet.pl'),
        SizedBox(height: 40),
        ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10)),
            overlayColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(201, 116, 149, 0.5)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(227, 213, 219, 0.5)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () => launch('www.linkedin.com/in/angelikaostrowska'),
          label: Text('Linkedin'),
          icon: Icon(Icons.person),
        ),
        Spacer(),
      ])),
    );
  }
}
