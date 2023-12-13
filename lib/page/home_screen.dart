// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_book/layout/footer_bar.dart';
import 'package:story_book/models/cerita_model.dart';
import 'package:story_book/page/about_screen.dart';
import 'package:story_book/page/sinopsis_screen.dart';
import 'package:story_book/page/upload_screen.dart';
import 'package:story_book/controllers/cerita_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  bool isAllSelected = false;
  int _selectedIndex = 0;
  final CeritaController ceritaController = CeritaController();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 2) {
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
            'Cerita Rakyat Sumbawa',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.26,
              color: Color(0xff141e47),
            ),
            textAlign: TextAlign.left, // Set the text alignment to left
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: null,
          titleSpacing: -20,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // bestsellingbooks1w1 (0:118)
                                margin: EdgeInsets.fromLTRB(0, 0,
                                    MediaQuery.of(context).size.width * 0.4, 0),
                                child: Text(
                                  'Semua Cerita',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 1.26,
                                    color: Color(0xff141e47),
                                  ),
                                ),
                              ),
                              Container(
                                // seeallwZm (0:119)
                                margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // seeallHNj (0:120)
                                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: Text(
                                        'See all',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          height: 1.26,
                                          color: Color(0xff8599ff),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // vector1Pgf (0:121)
                                      width: 3.5,
                                      height: 7,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 10,
                                        color: Color(0xff8599ff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<CeritaModel>>(
                            future: ceritaController.fetchCeritaData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // While data is being fetched, show a loading indicator
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                // If there's an error, show an error message
                                return Text('Error: ${snapshot.error}');
                              } else {
                                List<CeritaModel> ceritaList = snapshot.data!;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ceritaList.length,
                                  itemBuilder: (context, index) {
                                    CeritaModel cerita = ceritaList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // // Update the selected item index
                                          // selectedTabIndex = index;
                                          // // Update isAllSelected based on the selected item
                                          // isAllSelected = false;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        height: 299.5,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 129,
                                              height: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // rectangle8dqu (0:85)
                                                    width: 129,
                                                    height: 194,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.network(
                                                        'https://lombokfuntransport.com/back_office_story_book/${cerita.featuredImage.original}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(5, 0, 5, 0),
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          // displacementhZm (0:86)
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 5, 0, 5.5),
                                                          child: Text(
                                                            '${cerita.title}',
                                                            style: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 1.26,
                                                              color: Color(
                                                                  0xff141e47),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(0,
                                                                  0, 0, 6.05),
                                                          child: Text(
                                                            'Wahyudi',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.1725,
                                                              color: const Color(
                                                                  0xff000000),
                                                            ),
                                                            maxLines:
                                                                1, // Mengatur maksimum 2 baris
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 28.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xff8599ff),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.5),
                                                          ),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Sinopsis(
                                                                          id: cerita
                                                                              .id),
                                                                ),
                                                              );
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                'Sinopsis',
                                                                style: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.1725,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
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
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 1.5, 20),
                          padding: EdgeInsets.fromLTRB(20, 13.5, 20, 13.5),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // trendingnow1cX (0:78)
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    MediaQuery.of(context).size.width * 0.22,
                                    0),
                                child: Text(
                                  'Cerita Populer',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 1.26,
                                    color: Color(0xff141e47),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: FutureBuilder<List<CeritaModel>>(
                                future: ceritaController.fetchCeritaData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // While data is being fetched, show a loading indicator
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    // If there's an error, show an error message
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    List<CeritaModel> ceritaList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: ceritaList.length,
                                      itemBuilder: (context, index) {
                                        CeritaModel cerita = ceritaList[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // // Update the selected item index
                                              // selectedTabIndex = index;
                                              // // Update isAllSelected based on the selected item
                                              // isAllSelected = false;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            height: 299.5,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 129,
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        // rectangle8dqu (0:85)
                                                        width: 129,
                                                        height: 194,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          child: Image.network(
                                                            'https://lombokfuntransport.com/back_office_story_book/${cerita.featuredImage.original}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(
                                                            5, 0, 5, 0),
                                                        width: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              // displacementhZm (0:86)
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0,
                                                                      5,
                                                                      0,
                                                                      5.5),
                                                              child: Text(
                                                                '${cerita.title}',
                                                                style: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.26,
                                                                  color: Color(
                                                                      0xff141e47),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      6.05),
                                                              child: Text(
                                                                'Wahyudi',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height:
                                                                      1.1725,
                                                                  color: const Color(
                                                                      0xff000000),
                                                                ),
                                                                maxLines:
                                                                    1, // Mengatur maksimum 2 baris
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 28.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xff8599ff),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.5),
                                                              ),
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Sinopsis(
                                                                              id: cerita.id),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    'Sinopsis',
                                                                    style: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      height:
                                                                          1.1725,
                                                                      color: const Color(
                                                                          0xffffffff),
                                                                    ),
                                                                  ),
                                                                ),
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
                                    );
                                  }
                                })),
                      ],
                    ),
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
