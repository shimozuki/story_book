import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_book/layout/footer_bar.dart';
import 'package:story_book/page/about_screen.dart';
import 'package:story_book/page/home_screen.dart';
import 'package:story_book/page/quiz/quiz_screen.dart';
import 'package:story_book/page/upload_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool isAllSelected = false;
  int _selectedIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.3325,
              color: Color(0xff000000),
              decorationColor: Color(0xff000000),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 1,
          centerTitle: true, // Membuat teks menjadi di tengah
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.6988,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      24, MediaQuery.of(context).size.height * 0.02, 0, 0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 137,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffc4c4c4),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/d89d2d3f3a0467ff95704e27bcd702bb.jpg'),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupaymmief (VJ11475UFM3129GS1zayMM)
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // autogroupxv2s4Cj (VHzzYnazMpUiApXb4TxV2s)
                                      margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
                                      width: 166,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // bestmusicPVu (39:2213)
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 7),
                                            child: Text(
                                              'Quiz Peter Pan',
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                letterSpacing: -0.4599999905,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // autogroupt1x1thZ (VHzzfnPLCNA41VvzcAt1X1)
                                            width: double.infinity,
                                            height: 24,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  // playlisteRq (39:2214)
                                                  '10 Soal',
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                    letterSpacing:
                                                        -0.3679999924,
                                                    color: Color(0xff848484),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
