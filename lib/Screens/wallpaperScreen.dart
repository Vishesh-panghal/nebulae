// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              return Hero(
                tag: 'pic-1',
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Image.network(widget.imgAdd),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
