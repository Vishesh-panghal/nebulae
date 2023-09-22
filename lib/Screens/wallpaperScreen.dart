// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class WallpaperScreenPage extends StatefulWidget {
  String imgAdd;
  WallpaperScreenPage({
    Key? key,
    required this.imgAdd,
  }) : super(key: key);

  @override
  State<WallpaperScreenPage> createState() => _WallpaperScreenPageState();
}

class _WallpaperScreenPageState extends State<WallpaperScreenPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color(0xff000000),
            Color(0xff330867),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Hero(
            tag: '$widget.imgAdd',
            child: SizedBox(
              height: double.infinity,
              child: Image.network(
                widget.imgAdd,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: Color.fromARGB(158, 64, 64, 64),
              ),
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
