import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  bool isAllSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Folklore Of Sumbawa',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.26,
              color: Color(0xff141e47),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu_outlined,
              color: Color(0xff141e47),
            ),
            onPressed: () {
              print('Hamburger icon clicked!');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  child: Container(
                    width: 378,
                    height: 128,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Update the selected item index
                                    selectedTabIndex = index;
                                    // Update isAllSelected based on the selected item
                                    isAllSelected = false;
                                  });
                                },
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 78,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffe9ecef),
                                          ),
                                          color: selectedTabIndex == index
                                              ? Color(0xff8599ff)
                                              : isAllSelected
                                                  ? Color(0xff8599ff)
                                                  : Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Horror',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              height: 1.1725,
                                              color: selectedTabIndex == index
                                                  ? Colors
                                                      .white // Text color when clicked
                                                  : isAllSelected
                                                      ? Colors.white
                                                      : Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
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
                Positioned(
                  left: 0,
                  top: 85,
                  child: Container(
                    width: 437,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 61.5, 5),
                          padding: EdgeInsets.fromLTRB(20, 13.5, 20, 13.5),
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // bestsellingbooks1w1 (0:118)
                                margin: EdgeInsets.fromLTRB(0, 0, 124, 0),
                                child: Text(
                                  'Best Folklore',
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
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
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
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                                    BorderRadius.circular(6),
                                                child: Image.asset(
                                                  'assets/images/q2yxj21v8nACZBEtNTOK-o.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // displacementhZm (0:86)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 5, 0, 5.5),
                                                    child: Text(
                                                      'Displacement',
                                                      style: GoogleFonts
                                                          .plusJakartaSans(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.26,
                                                        color:
                                                            Color(0xff141e47),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 0, 6.05),
                                                    child: Text(
                                                      'Story Creator',
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.1725,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      maxLines:
                                                          1, // Mengatur maksimum 2 baris
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 28.5,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff8599ff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.5),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        // if (rekomendasy
                                                        //         .kdBarang !=
                                                        //     null) {
                                                        //   print(rekomendasy
                                                        //       .kdBarang);
                                                        //   showAddChartModal(
                                                        //       context,
                                                        //       rekomendasy
                                                        //           .kdBarang!);
                                                        // } else {
                                                        //   print("Null");
                                                        // }
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Read',
                                                          style: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.1725,
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    width: 437,
                    height: 369.5,
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
                                margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                                child: Text(
                                  'Language Sumbawa',
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
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
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
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                                                    BorderRadius.circular(6),
                                                child: Image.asset(
                                                  'assets/images/q2yxj21v8nACZBEtNTOK-o.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // displacementhZm (0:86)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 5, 0, 5.5),
                                                    child: Text(
                                                      'Displacement',
                                                      style: GoogleFonts
                                                          .plusJakartaSans(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.26,
                                                        color:
                                                            Color(0xff141e47),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 0, 6.05),
                                                    child: Text(
                                                      'Story Creator',
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.1725,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      maxLines:
                                                          1, // Mengatur maksimum 2 baris
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 28.5,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff8599ff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.5),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        // if (rekomendasy
                                                        //         .kdBarang !=
                                                        //     null) {
                                                        //   print(rekomendasy
                                                        //       .kdBarang);
                                                        //   showAddChartModal(
                                                        //       context,
                                                        //       rekomendasy
                                                        //           .kdBarang!);
                                                        // } else {
                                                        //   print("Null");
                                                        // }
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Read',
                                                          style: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.1725,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 571,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

