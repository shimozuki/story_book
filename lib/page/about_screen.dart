// ignore_for_file: unused_local_variable, unused_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_book/controllers/about_controller.dart';
import 'package:story_book/layout/footer_bar.dart';
import 'package:story_book/models/about_model.dart';
import 'package:story_book/page/home_screen.dart';
import 'package:story_book/page/quiz_screen.dart';
import 'package:story_book/page/upload_screen.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isAddButtonClicked = false;
  int _selectedIndex = 2;
  AboutModel? aboutData;

  @override
  void initState() {
    super.initState();
    _fetchAboutData();
  }

  void _fetchAboutData() async {
    try {
      AboutController aboutController = AboutController();
      AboutModel? data = await aboutController.fetchData();

      if (data != null) {
        setState(() {
          aboutData = data;
        });
        print(aboutData!.imageTitle);
      }
    } catch (e) {
      print("Error fetching about data: $e");
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Text(
            'About Apps',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xff000000),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff000000), // Ubah warna icon menjadi hitam
          ),
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (aboutData != null)
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: 495,
                          height: 324,
                          child: Image.network(
                              'https://ceritarakyatsumbawa.com/${aboutData!.image}'),
                        ),
                        Container(
                          // homeindicatorEVR (35461:438)
                          margin: EdgeInsets.fromLTRB(163.5, 0, 180.5, 11),
                          width: double.infinity,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 62, 90, 243),
                          ),
                        ),
                        Container(
                          // imheretoquellyo9cP (35461:394)
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          constraints: BoxConstraints(
                            maxWidth: 388,
                          ),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.875,
                                color: Color(0xff2e2f41),
                              ),
                              children: [
                                TextSpan(
                                  text: '${aboutData!.imageTitle}',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.875,
                                    color: Color(0xff2e2f41),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
