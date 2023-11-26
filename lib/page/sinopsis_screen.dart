import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_book/page/story_screen.dart';

class Sinopsis extends StatefulWidget {
  const Sinopsis({super.key});

  @override
  State<Sinopsis> createState() => _SinopsisState();
}

class _SinopsisState extends State<Sinopsis> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        width: 393,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: 790.47,
                                  height: 1243,
                                  child: Image.asset(
                                    'assets/images/bg-4.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 120,
                              top: MediaQuery.of(context).size.height * 0.11,
                              child: Align(
                                child: SizedBox(
                                  width: 152.63,
                                  height: 240,
                                  child: Image.asset(
                                    'assets/images/d89d2d3f3a0467ff95704e27bcd702bb.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.25,
                              top: MediaQuery.of(context).size.height * 0.03,
                              child: Container(
                                width: 260,
                                height: 48,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Text(
                                              'Walt Desney Peter',
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                height: 1.3325,
                                                color: Color.fromARGB(
                                                    255, 250, 250, 250),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Walt Desney',
                                            style: GoogleFonts.plusJakartaSans(
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
                                  ],
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
                                margin: EdgeInsets.fromLTRB(0, 1.19, 0, 1.19),
                                padding:
                                    EdgeInsets.fromLTRB(5.5, 2.75, 5.5, 2.75),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfffff8df),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      // Xj1 (10:1151)
                                      'Indonesia',
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
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                // frame21U8T (10:1152)
                                width: 66,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffe2fbfa),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Fantasy',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2125,
                                      color: Color(0xff153337),
                                    ),
                                  ),
                                ),
                              ),
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
                                      text: '432 View',
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
                            'Synopsis',
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
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Text(
                            'Elspeth needs a monster. The monster might be her. Elspeth Spindle needs more than luck to stay safe in the eerie, mist-locked kingdom of Blunder—she needs a monster. She calls him the Nightmare, an ancient, mercurial spirit trapped in her head. He protects her. He keeps her secrets.\n \nBut nothing comes for free, especially magic. When Elspeth meets a mysterious highwayman on the forest road, her life takes a drastic turn. Thrust into a world of shadow and deception, she joins a dangerous quest to cure Blunder from the dark magic infecting it. And the highwayman? He just so happens to be the King’s nephew, Captain of the most dangerous men in Blunder…and guilty of high treason.\n\nTogether they must gather twelve Providence Cards—the keys to the cure. But as the stakes heighten and their undeniable attraction intensifies, Elspeth is forced to face her darkest secret yet: the Nightmare is slowly taking over her mind. And she might not be able to stop him',
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
                  // InkWell(
                  //   onTap: () {
                  //     // final userProvider =
                  //     //     Provider.of<UserProvider>(context, listen: false);

                  //     // List<Map<String, dynamic>> selectedItems =
                  //     //     _template.map((item) {
                  //     //   return {
                  //     //     "kdBarang": item["kd_barang"],
                  //     //     "kdSatuan": item["kd_satuan"],
                  //     //     "qty": item["qty"],
                  //     //   };
                  //     // }).toList();

                  //     // Navigator.of(context).push(
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => SelectTemplateCart(
                  //     //       selectedItems: selectedItems,
                  //     //       token: userProvider.user!.mobToken,
                  //     //     ),
                  //     //   ),
                  //     // );
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(
                  //           40), // set border radius menjadi setengah dari width/height
                  //       border: Border.all(
                  //           color: Color(0xffbd212f), width: 2), // set border
                  //     ),
                  //     // frame59xbR (175:298)
                  //     width: 46,
                  //     height: 46,
                  //     child: Icon(
                  //       Icons.save_alt_outlined,
                  //       color: Color(0xffbd212f),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Story(),
                          ),
                        );
                      // if (_jenis_user == 1) {
                      //   checkout();
                      // } else if (_jenis_user == 2) {
                      //   approver();
                      // } else if (_jenis_user == 3) {
                      //   drafter();
                      // }
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
