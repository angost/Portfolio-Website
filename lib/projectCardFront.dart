import 'package:flutter/material.dart';

class ProjectCardFront extends Card {
  BuildContext context;
  String name, description, imgPath;
  ProjectCardFront(this.context, this.name, this.description, this.imgPath,
      {super.key})
      : super(
            child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(name, style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Image.asset(imgPath),
              ]),
        ));
}
