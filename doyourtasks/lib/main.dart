import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:doyourtasks/others/testresponsive.dart';
import 'package:doyourtasks/views/welcome_page/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
