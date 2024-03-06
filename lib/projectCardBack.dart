import 'package:flutter/material.dart';

class ProjectCardBack extends Card {
  BuildContext context;
  String description;
  ProjectCardBack(this.context, this.description, {super.key})
      : super(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(227, 203, 214, 1),
                      foregroundColor: Color.fromRGBO(191, 166, 178, 1),
                      textStyle: Theme.of(context).textTheme.displaySmall),
                  child: Text(
                    "See more",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: Colors.black),
                  ),
                )
              ]),
        );
}
