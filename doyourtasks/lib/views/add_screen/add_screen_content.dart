import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:doyourtasks/views/welcome_page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddScreenContent extends StatelessWidget {
  const AddScreenContent(Size size, BuildContext context, {super.key});

  void _navigateToHomeScreenAfterAdd(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void _navigateToHomeScreenAfterGetBack(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AddScreen(size, context);
  }

  Scaffold AddScreen(Size size, BuildContext context) {
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              height: 130,
              width: size.width,
              child: Image.asset(
                'assets/images/RockYourTasks.png',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: size.width * 0.9,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "New task",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 370,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "What's the name of the task?",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 120,
              width: 370,
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Describe your task",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navigateToHomeScreenAfterAdd(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(250, 20, 98, 233),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 23),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "Let's rock your tasks",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navigateToHomeScreenAfterGetBack(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 23),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2, color: Color.fromARGB(250, 20, 98, 233)),
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "Get back",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
