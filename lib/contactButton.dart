import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class ContactButton extends StatefulWidget {
  String labelText;
  Widget icon;
  Uri link;
  ContactButton(this.labelText, this.icon, this.link, {super.key});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10)),
        overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(201, 116, 149, 0.5)),
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(227, 213, 219, 0.5)),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: () {
        launchUrl(widget.link);
      },
      icon: widget.icon,
      label: Text(
        widget.labelText,
        style: textBodyFancy,
      ),
    );
  }
}
