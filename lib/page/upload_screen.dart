// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:story_book/controllers/upload_controller.dart';
import 'package:story_book/layout/footer_bar.dart';
import 'package:story_book/page/about_screen.dart';
import 'package:story_book/page/home_screen.dart';
import 'package:story_book/page/quiz_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  int _selectedIndex = 1;
  final _uploadService = UploadService();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    } else if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  XFile? image;
  XFile? background;

  final ImagePicker picker = ImagePicker();

  String? _selectedFilePath;
  String? _selectedFilePathD;
  Future<void> _pickAudio() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _selectedFilePathD = result.files.single.path!;
      });
    }
  }

  String? _name;
  String? _whatsapp;
  String? _email;
  String? _judul_cerita;

  Future<void> _pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
        print("file excel : ${_selectedFilePath}");
      });
    }
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future getBackgoriund(ImageSource media) async {
    var bg = await picker.pickImage(source: media);

    setState(() {
      background = bg;
    });
  }

  void myAlertbg() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getBackgoriund(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getBackgoriund(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Tambah Cerita',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xff000000),
            ),
          ),
          backgroundColor: const Color(0xffffffff),
          centerTitle: false,
          iconTheme: const IconThemeData(
            color: Color(0xff000000), // Ubah warna icon menjadi hitam
          ),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 253, 253, 253),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        25, MediaQuery.of(context).size.height * 0.1, 0, 0),
                    child: Text(
                      'Tambah Cerita Sesuai Template yang ada',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 22.5, 15, 15.5),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 72,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 399, 0),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.person,
                                      color: Color.fromARGB(78, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(34, 0, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "Nama",
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => _name = value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 72,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 399, 0),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.phone_android,
                                      color: Color.fromARGB(78, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(34, 0, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "WhatsApp",
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => _whatsapp = value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 72,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 399, 0),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.email,
                                      color: Color.fromARGB(78, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(34, 0, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "Email",
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => _email = value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            width: 134,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 399, 0),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.book,
                                      color: Color.fromARGB(78, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(34, 0, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                      hintText: "Judul Cerita",
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) => _judul_cerita = value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: GestureDetector(
                            onTap: _pickAudio,
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 2.5, 10, 0),
                                  width: 24,
                                  height: 24,
                                  child: const Icon(
                                    Icons.audio_file,
                                    color: Color.fromARGB(78, 0, 0, 0),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _selectedFilePathD != null
                                        ? _selectedFilePathD!
                                        : "Pilih Audio",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     // if (_isChecked &&
                        //     //     _formKey.currentState!.validate()) {
                        //     //   _formKey.currentState!.save();
                        //     //   _registerUser();
                        //     // }
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(bottom: 10),
                        //     width: double.infinity,
                        //     height: 46,
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xff8599ff),
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //     child: Center(
                        //       child: Center(
                        //         child: Text(
                        //           "Download Template",
                        //           textAlign: TextAlign.center,
                        //           style: GoogleFonts.plusJakartaSans(
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w700,
                        //             height: 1.1725,
                        //             color: const Color(0xffffffff),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: GestureDetector(
                            onTap: _pickFile,
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 2.5, 10, 0),
                                  width: 24,
                                  height: 24,
                                  child: const Icon(
                                    Icons.attach_file,
                                    color: Color.fromARGB(78, 0, 0, 0),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _selectedFilePath != null
                                        ? _selectedFilePath!
                                        : "Pilih Excel file",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 9.5),
                                    child: Text(
                                      'Gambar Sampul',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  (background == null)
                                      ? ElevatedButton(
                                          onPressed: () {
                                            myAlertbg();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(35.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            primary: Color.fromARGB(
                                                255, 230, 229, 229),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.grey.shade700,
                                              ),
                                              SizedBox(width: 1.0),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  File(background!.path)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 9.5),
                                    child: Text(
                                      'Gambar Cerita',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.1725,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  (image == null)
                                      ? ElevatedButton(
                                          onPressed: () {
                                            myAlert();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(35.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            primary: Color.fromARGB(
                                                255, 230, 229, 229),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.grey.shade700,
                                              ),
                                              SizedBox(width: 1.0),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image:
                                                  FileImage(File(image!.path)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // Add any additional logic or validation here before calling the service

                              // Call the uploadStory method from UploadService
                              Map<String, dynamic> uploadResult =
                                  await _uploadService.uploadStory(
                                judul: _judul_cerita!,
                                whatsapp: _whatsapp!,
                                image: image != null ? File(image!.path) : null,
                                background: background != null
                                    ? File(background!.path)
                                    : null,
                                // Add other parameters as needed
                                nama: _name!,
                                email: _email!,
                                audio: _selectedFilePathD != null
                                    ? File(_selectedFilePathD!)
                                    : null,
                                selectFile: _selectedFilePath != null
                                    ? File(_selectedFilePath!)
                                    : null,
                              );

                              print("judulnya adalah : ${_judul_cerita}");
                              // Handle the result as needed
                              if (uploadResult['success']) {
                                Fluttertoast.showToast(
                                  msg: 'Story uploaded successfully',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                // Additional logic after successful upload
                              } else {
                                Fluttertoast.showToast(
                                  msg:
                                      'Error uploading story: ${uploadResult['message']}',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                // Additional logic for handling upload failure
                              }
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: double.infinity,
                            height: 46,
                            decoration: BoxDecoration(
                              color: const Color(0xff8599ff),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Center(
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 1.1725,
                                    color: const Color(0xffffffff),
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
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
