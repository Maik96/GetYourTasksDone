import 'package:doyourtasks/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String name = "Hi Maik";
    String afternoonText = "Good afternoon";

    return HomeScreenContent(
        size: size, name: name, afternoonText: afternoonText);
  }
}
