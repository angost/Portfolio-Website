import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class ProjectCardFront extends Card {
  BuildContext context;
  String name, imgPath;
  ProjectCardFront(this.context, this.name, this.imgPath, {super.key})
      : super(
            // elevation: 0,
            shadowColor: Colors.transparent,
            color: Color.fromRGBO(250, 242, 250, 1),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(name, style: textBodyMedium),
                      ),
                      SizedBox(height: 10),
                      Image.asset(imgPath),
                    ]),
              ),
            ));
}
