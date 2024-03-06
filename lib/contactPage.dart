// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/myAppBar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Contact"),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
