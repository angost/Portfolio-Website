import 'package:flutter/material.dart';

class ProjectCardBack extends Card {
  BuildContext context;
  String description;
  ProjectCardBack(this.context, this.description, {super.key})
      : super(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ]),
        );
}
