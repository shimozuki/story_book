// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_book/controllers/detail_controller.dart';
import 'package:story_book/models/detail_model.dart';
import 'package:story_book/page/story_screen.dart';

class Sinopsis extends StatefulWidget {
  final int id;

  const Sinopsis({required this.id, Key? key}) : super(key: key);

  @override
  _SinopsisState createState() => _SinopsisState();
}

class _SinopsisState extends State<Sinopsis> {
  late Future<DetailModel?> _futureDetail;
  String currentText = 'Indonesia';

  void changeText() {
    setState(() {
      currentText = (currentText == 'Indonesia') ? 'Sumbawa' : 'Indonesia';
    });
  }

  @override
  void initState() {
    super.initState();
    _futureDetail = DetailController().fetchData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<DetailModel?>(
          future: _futureDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No data available'),
              );
            } else {
              DetailModel detail = snapshot.data!;
              String firstHalfCeritaIndo = detail.ceritaIndo
                  .substring(0, (detail.ceritaIndo.length / 2).round());
              String firsHalfCeritaswq = detail.ceritaSwq
                  .substring(0, (detail.ceritaIndo.length / 2).round());
              String getSelectedCerita() {
                if (currentText == 'Indonesia') {
                  return firstHalfCeritaIndo;
                } else if (currentText == 'Sumbawa') {
                  return firsHalfCeritaswq;
                } else {
                  return 'Cerita tidak ditemukan';
                }
              }

              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.53,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 993,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Align(
                                      child: SizedBox(
                                        width: 800,
                                        height: 1243,
                                        child: Container(
                                          color: const Color(
                                              0xff8599ff), // Set the background color to sky blue
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 130,
                                    top: MediaQuery.of(context).size.height *
                                        0.11,
                                    child: Align(
                                      child: SizedBox(
                                        width: 152.63,
                                        height: 240,
                                        child: Image.network(
                                          'https://ceritarakyatsumbawa.com/${detail.featuredImage.original}',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/bg-5.jpg'); // Replace with your placeholder image asset
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 60,
                                    top: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: Container(
                                      width: 300,
                                      height: 48,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: FractionallySizedBox(
                                          widthFactor: 1.0,
                                          child: Container(
                                            height: 48,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${detail.title}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.3325,
                                                    color: Color.fromARGB(
                                                        255, 250, 250, 250),
                                                  ),
                                                ),
                                                Text(
                                                  '${detail.name}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.2125,
                                                    color: Color.fromARGB(
                                                        255, 250, 250, 250),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 49,
                            top: MediaQuery.of(context).size.height * 0.46,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(27, 15, 26.75, 16),
                              width: 295,
                              height: 54,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0c000000),
                                    offset: Offset(0, 24),
                                    blurRadius: 25,
                                  ),
                                ],
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          50, 1.19, 0, 1.19),
                                      padding: EdgeInsets.fromLTRB(
                                          5.5, 2.75, 5.5, 2.75),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xfffff8df),
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              changeText();
                                            },
                                            child: Text(
                                              // Xj1 (10:1151)
                                              currentText,
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                height: 1.2125,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    // Container(
                                    //   // frame21U8T (10:1152)
                                    //   width: 66,
                                    //   height: double.infinity,
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xffe2fbfa),
                                    //     borderRadius: BorderRadius.circular(8),
                                    //   ),
                                    //   child: Center(
                                    //     child: Text(
                                    //       'Fantasy',
                                    //       style: GoogleFonts.plusJakartaSans(
                                    //         fontSize: 12,
                                    //         fontWeight: FontWeight.w500,
                                    //         height: 1.2125,
                                    //         color: Color(0xff153337),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    RichText(
                                      // pagesxJX (10:1154)
                                      text: TextSpan(
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2102272511,
                                          color: Color(0xff000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '1 Views',
                                            style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              height: 1.2125,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                child: Text(
                                  'Sinopsis',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3325,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: Text(
                                  getSelectedCerita(),
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.6666666667,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            // checkoutwrapperf6X (175:297)
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            width: double.infinity,
            height: 66,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(51, 207, 207, 207)),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Story(id: widget.id, language: currentText),
                      ),
                    );
                  },
                  child: Container(
                    // frame60zo1 (175:306)
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff8599ff),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Reading',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.1725,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
