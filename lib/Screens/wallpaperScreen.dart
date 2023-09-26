// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

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
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
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
          Positioned(
              top: size.height * 0.06,
              left: size.width * 0.05,
              child: Container(
                padding: EdgeInsets.only(right: size.width * 0.1),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    InkWell(
                      child: Icon(Icons.share),
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color.fromARGB(57, 0, 0, 0),
              padding: EdgeInsets.only(
                  right: size.width * 0.1, left: size.width * 0.1),
              height: size.height * 0.1,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      downloadWallpaper();
                    },
                    child: Icon(
                      Icons.download_rounded,
                      color: Color.fromARGB(201, 255, 255, 255),
                      size: size.width * 0.08,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        setWallpaper();
                      },
                      child: Icon(
                        Icons.image,
                        color: Color.fromARGB(201, 255, 255, 255),
                        size: size.width * 0.08,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void setWallpaper() {
    var downloadStream = Wallpaper.imageDownloadProgress(widget.imgAdd);

    downloadStream.listen(
      (event) {
        print(event.toString());
      },
      onDone: () async {
        print("Wallpaper Download in catch...!!");
      },
    );
  }

  void downloadWallpaper() async {
    // GallerySaver.saveImage(widget.imgAdd)
    GallerySaver.saveImage(widget.imgAdd)
    .then(
      (value) => print( "Manuel check:- $value"),
    );
  }
}
