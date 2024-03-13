import 'package:flutter/material.dart';

ThemeData baseTheme = ThemeData(
    primaryColor: const Color.fromRGBO(157, 95, 95, 1),
    fontFamily: 'DM Serif Text',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: 'DM Serif Text', fontSize: 56),
      displayMedium: TextStyle(fontFamily: 'DM Serif Text', fontSize: 28),
      displaySmall: TextStyle(fontFamily: 'DM Serif Text', fontSize: 18),
      bodyLarge: TextStyle(fontFamily: 'DM Mono'),
      bodyMedium: TextStyle(fontFamily: 'DM Mono'),
    ));

TextStyle textLarge =
    const TextStyle(fontFamily: 'DM Serif Text', fontSize: 56);
TextStyle textMenu = const TextStyle(fontFamily: 'DM Serif Text', fontSize: 28);
TextStyle textBodyLargeBold = const TextStyle(
    fontFamily: 'DM Mono', fontSize: 17, fontWeight: FontWeight.w600);
TextStyle textBodyMedium = const TextStyle(fontFamily: 'DM Mono', fontSize: 16);
TextStyle textBodyMediumBold = const TextStyle(
    fontFamily: 'DM Mono', fontSize: 16, fontWeight: FontWeight.w600);
TextStyle textBodySmall = const TextStyle(fontFamily: 'DM Mono', fontSize: 14);
TextStyle textButtons =
    const TextStyle(fontFamily: 'DM Serif Text', fontSize: 18);
TextStyle textBodyFancy =
    const TextStyle(fontFamily: 'DM Serif Text', fontSize: 24);
