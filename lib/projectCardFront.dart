import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/theme_constants.dart';

class ProjectCardFront extends Card {
  BuildContext context;
  ProjectCardFront(this.context, {super.key})
      : super(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Project Title',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  'Description, description, description, lorem ipsum dot sit amet',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Image.asset('assets/images/fish.png'),
              ]),
        ));
}
