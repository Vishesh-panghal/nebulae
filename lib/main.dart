// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nebulae/Widgets/Themes.dart';

import 'Auth/login_page.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      // darkTheme: MyAppTheme.darkTheme(),
      // theme: MyAppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}