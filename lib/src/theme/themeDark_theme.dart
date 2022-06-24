import 'package:flutter/material.dart';

final myTema = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
        // secondaryContainer: Colors.red,
        secondary: Colors.red,
        // background: accentColor,
        primary: accentColor)
    //colorScheme: ColorScheme.dark(secondary: Colors.red)
    );

final accentColor = Colors.red;
