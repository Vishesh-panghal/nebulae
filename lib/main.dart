// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nebulae/Api/api_helper.dart';
import 'package:nebulae/Widgets/Themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Auth/login_page.dart';
import 'Bloc/trending/trending_api_integration_bloc.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TrendingWalpaperBloc(apiHelper: ApiHelper()),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
