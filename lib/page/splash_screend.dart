import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_book/page/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(
              44,
              MediaQuery.of(context).size.height * 0.1,
              43.11,
              MediaQuery.of(context).size.height * 0.01),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: const BoxDecoration(
            color: Color(0xff8599ff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 65.5),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 24.33, 0),
                      width: 234,
                      height: 292,
                      child: Image.asset(
                        'assets/images/Frame.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 51.33, 15),
                      constraints: BoxConstraints(
                        maxWidth: 261,
                      ),
                      child: Text(
                        'Baca dan Lestarikan Cerita Rakyat Sumbawa.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          height: 1.26,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      // loremipsumissimplydummytextoft (1:746)
                      margin: EdgeInsets.fromLTRB(0, 0, 56.33, 30),
                      constraints: BoxConstraints(
                        maxWidth: 250,
                      ),
                      child: Text(
                        'Aplikasi cerita rakyat Sumbawa, jendela ajaib ke dunia digital budaya loka.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.4549999771,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      child: Container(
                        // ctaExj (1:749)
                        margin: EdgeInsets.fromLTRB(18, 0, 15.33, 18.5),
                        width: double.infinity,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Color(0xff141e47),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Center(
                            child: Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                height: 1.26,
                                color: Color(0xffffffff),
                              ),
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
        
      ),
    );
  }
}
