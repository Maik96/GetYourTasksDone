import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
          child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(color: Colors.blue),
        child: const Center(
          child: Text(
            "Hallo",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      )),
    ));
  }
}
