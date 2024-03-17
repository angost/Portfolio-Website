import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class HomePageButton extends StatefulWidget {
  String labelText;
  Widget icon;
  Function pageOpener;
  HomePageButton(this.labelText, this.icon, this.pageOpener, {super.key});

  @override
  State<HomePageButton> createState() => _HomePageButtonState();
}

class _HomePageButtonState extends State<HomePageButton> {
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
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                widget.pageOpener(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      icon: Text(
        widget.labelText,
        style: textBodyFancy,
      ),
      label: widget.icon,
    );
  }
}
