import 'package:flutter/material.dart';
import 'package:story_book/page/splash_screend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Story',
      home: const Splash(),
    );
  }
}


