// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:story_book/controllers/detail_controller.dart';
import 'package:story_book/models/detail_model.dart';
import 'package:story_book/page/quiz/quiz_screen.dart';
import 'package:story_book/page/quiz_screen.dart';

class Story extends StatefulWidget {
  final int id;
  final String language;

  const Story({required this.id, required this.language, Key? key})
      : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isQuizButtonEnabled = true;
  DetailModel? detailData;
  late String modifiedTitle = '';
  late String modifiedTitleswq = '';

  @override
  void initState() {
    super.initState();
    _fetchDetailData();
    detailData = DetailModel(
      id: 0,
      title: '',
      ceritaIndo: '',
      ceritaSwq: '',
      featuredImage: FeaturedImage(
        original: '',
        thumb: '',
        medium: '',
        url: null, // or provide a default URL if applicable
      ),
      background: '',
      featuredAudio: '',
      active: '',
      userId: '',
      featuredPost: '',
      createdAt: DateTime.now(), // Set to the current date and time
      updatedAt: DateTime.now(), // Set to the current date and time
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _fetchDetailData() async {
    final DetailController detailController = DetailController();

    try {
      final DetailModel? data = await detailController.fetchData(widget.id);
      setState(() {
        detailData = data;
        modifiedTitle = detailData!.ceritaIndo
            .replaceAll('.', '\n')
            .replaceAll('..', '\n\n');
        modifiedTitleswq = detailData!.ceritaSwq
            .replaceAll('.', '\n')
            .replaceAll('..', '\n\n');
        // indo =
        //     detailData.lirikIndo.replaceAll('.', '\n').replaceAll('..', '\n\n');
      });

      if (detailData!.featuredAudio.isNotEmpty) {
        audioPlayer.open(
          Audio.network(
              'https://ceritarakyatsumbawa.com/${detailData!.featuredAudio}'),
          autoStart: false,
          showNotification: true,
        );
        audioPlayer.play();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  String getSelectedCerita() {
    if (widget.language == 'Indonesia') {
      return modifiedTitle;
    } else if (widget.language == 'Sumbawa') {
      return modifiedTitleswq;
    } else {
      return 'Cerita tidak ditemukan';
    }
  }

  // Fungsi untuk memainkan atau menghentikan audio
  void toggleAudio() {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.3325,
              color: Color(0xff000000),
              decorationColor: Color(0xff000000),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true, // Membuat teks menjadi di tengah
          actions: [
            IconButton(
              icon: Icon(audioPlayer.isPlaying.value
                  ? Icons.pause_circle
                  : Icons.play_circle),
              onPressed: toggleAudio,
            ),

            // Tambahkan ikon lain di sini sesuai kebutuhan
          ],
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification.metrics.pixels > 100) {
              setState(() {
                isQuizButtonEnabled = false;
              });
            } else {
              setState(() {
                isQuizButtonEnabled = true;
              });
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 17, 31),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // chapteroneaEX (10:1169)
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 29),
                    child: Text(
                      '${detailData?.title ?? ''}',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        height: 1.3325,
                        color: Color(0xff000000),
                        decorationColor: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // frame25rxj (10:1170)
                    margin: EdgeInsets.fromLTRB(1, 0, 3, 30),
                    padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
                    width: double.infinity,
                    height: 236,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: Center(
                      // theinfectioncomesasfeveratnigh (10:1171)
                      child: SizedBox(
                        child: Container(
                          child: SizedBox(
                            width: 500,
                            height: 240,
                            child: Image.network(
                              "https://ceritarakyatsumbawa.com/${detailData?.background}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 46),
                    width: double.infinity,
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: getSelectedCerita(),
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(
                //           40), // set border radius menjadi setengah dari width/height
                //       border: Border.all(
                //           color: Color(0xff8599ff), width: 2), // set border
                //     ),
                //     // frame59xbR (175:298)
                //     width: 46,
                //     height: 46,
                //     child: Icon(
                //       Icons.share,
                //       color: Color(0xff8599ff),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                InkWell(
                  onTap: isQuizButtonEnabled
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(id_cerita: detailData?.id ),
                            ),
                          );
                        },
                  child: Container(
                    // frame60zo1 (175:306)
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          isQuizButtonEnabled ? Colors.grey : Color(0xff8599ff),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Quiz',
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
