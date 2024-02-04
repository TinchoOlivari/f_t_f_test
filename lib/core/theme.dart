import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),

  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.grey,
      fontSize: 12,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
  ),
  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  // textTheme: TextTheme(
  //   displayLarge: const TextStyle(
  //     fontSize: 72,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   // ···
  //   titleLarge: GoogleFonts.oswald(
  //     fontSize: 30,
  //     fontStyle: FontStyle.italic,
  //   ),
  //   bodyMedium: GoogleFonts.merriweather(),
  //   displaySmall: GoogleFonts.pacifico(),
);
