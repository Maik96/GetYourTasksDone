import 'package:doyourtasks/views/add_screen/add_screen.dart';
import 'package:doyourtasks/views/add_screen/add_screen_content.dart';
import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/add': (context) => const AddScreenContent(),
        '/back': (context) => const HomeScreen(),
      },
    );
  }
}
