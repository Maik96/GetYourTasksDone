// ignore_for_file: sized_box_for_whitespace

import 'package:doyourtasks/assets/variables/variables.dart';
import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:doyourtasks/snippets/example_task.dart';
import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:flutter/material.dart';

class WelcomeScreenContent extends StatelessWidget {
  const WelcomeScreenContent({super.key});

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextEditingController usernameController = TextEditingController(text: '');

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 234, 234, 234)),
          child: Column(
            children: [
              const SizedBox(height: 70),
              Container(
                height: 120,
                width: size.width,
                child: Image.asset(
                  'assets/images/logo_transparent.png',
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 160,
                width: size.width * 0.9,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Get your",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("task's done",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        infoText,
                        style: TextStyle(
                            color: Color.fromARGB(255, 98, 98, 98),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                        width: 100,
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: ExampleFact(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(250, 20, 98, 233),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _navigateToNextScreen(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: const Color.fromARGB(255, 255, 255, 255),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 23),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            "Let's rock your tasks",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
