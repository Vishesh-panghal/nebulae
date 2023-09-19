// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nebulae/Constants/Color_constants.dart';
import 'package:nebulae/Constants/Data_constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../Data/Data_modal/data_modal.dart';
import '../Widgets/Drawer.dart';
import 'package:http/http.dart' as http;

import 'wallpaperScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();

  final String API_KEY =
      'BqPWVyQC1cmDBDb0HtajPIFOvsQW30rGQC1cwhFgshqPA8XQinkGSINJ';
  late Future<DataModal?> data;

  @override
  void initState() {
    data = getApiData('Any');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'NEB',
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 13,
            ),
            children: [
              TextSpan(
                  text: 'U',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 22,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 13,
                  )),
              TextSpan(
                  text: 'LAE',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 13,
                  )),
            ],
          ),
        ),
        backgroundColor: ColorConstants.mainColor(),
        elevation: 0,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      backgroundColor: ColorConstants.backgroundColor(),
      drawer: MyDrawer(),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(31, 67, 67, 67),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: searchController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: 'search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      )),
                  // SizedBox(width: size.width * 0.2),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        data = getApiData(searchController.text.toString());
                        searchController.clear();
                      });
                    },
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                    ),
                  ))
                ],
              ),
              SizedBox(height: size.height * .01),
              //--------------Popular Category----------------------//
              Text(
                'Popular Now  ',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: const Color.fromARGB(255, 172, 170, 170),
                  fontSize: size.width * 0.035,
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
                width: size.width,
                child: FutureBuilder(
                  future: getApiData('popular'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data != null &&
                        snapshot.data!.photos != null &&
                        snapshot.data!.photos!.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.photos!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: size.width * 1 / 2,
                              child: Image.network(
                                '${snapshot.data?.photos![index].src!.landscape}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No data available',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.05),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * .01),
              Divider(thickness: 2, color: Colors.grey.shade900),
              SizedBox(height: size.height * .01),
              //-----------------Category List----------------//
              SizedBox(
                height: size.height * 0.05,
                width: size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: DataConstants.searchLst.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                data = getApiData(
                                    '${DataConstants.searchLst[index]}');
                              });
                            },
                            child: Text(
                              '${DataConstants.searchLst[index]}',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 172, 170, 170)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.008),
              //--------------------Wallpapers---------------------//
              FutureBuilder(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data != null &&
                      snapshot.data!.photos != null &&
                      snapshot.data!.photos!.isNotEmpty) {
                    return MasonryGridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data?.photos!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WallpaperScreenPage(
                                      imgAdd:
                                          '${snapshot.data?.photos![index].src!.large2x}'),
                                )),
                            child: Hero(
                              tag: 'pic',
                              child: Image.network(
                                  '${snapshot.data?.photos![index].src!.original}'),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.05),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DataModal?> getApiData(String query) async {
    Uri mUrl = Uri.parse('https://api.pexels.com/v1/search?query=$query');
    var res = await http.get(mUrl, headers: {'Authorization': API_KEY});

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      DataModal data = DataModal.fromJson(json);
      return data;
    } else {
      return DataModal();
    }
  }
}
