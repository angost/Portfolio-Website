import 'package:flutter/material.dart';

class ProjectCardFront extends Card {
  BuildContext context;
  String name, imgPath;
  ProjectCardFront(this.context, this.name, this.imgPath, {super.key})
      : super(
            child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(name, style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 10),
                  Image.asset(imgPath),
                ]),
          ),
        ));
}
