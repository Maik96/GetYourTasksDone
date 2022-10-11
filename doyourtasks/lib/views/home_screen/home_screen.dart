import 'package:doyourtasks/views/add_screen/add_screen.dart';
import 'package:doyourtasks/views/add_screen/add_screen_content.dart';
import 'package:doyourtasks/views/task_view/task_content_view.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    Key? key,
    required this.size,
    required this.name,
    required this.afternoonText,
  }) : super(key: key);

  final Size size;
  final String name;
  final String afternoonText;

  void _navigateToAddScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddContentView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: size.height,
        decoration:
            const BoxDecoration(color: Color.fromARGB(250, 20, 98, 233)),
        child: Column(
          children: [
            SizedBox(width: size.width, height: 80),
            Container(
              width: size.width,
              height: size.height * 0.2,
              // decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Row(children: [
                const SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(
                        color: Color.fromARGB(255, 9, 22, 180), width: 3),
                  ),
                  height: 120,
                  width: 120,
                  child: Image.asset('assets/images/RockYourTasksRound.png'),
                ),
                // Wird nacher gefuellt mit einem Icon
                Container(
                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                  width: 180,
                  height: 120,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          afternoonText,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 211, 211, 211),
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
              ]),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red, width: 3),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text("4 tasks remaining",
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.left),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                ),
                Container(
                  height: 80,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 70,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      _navigateToAddScreen(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.55,
                  width: size.width,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * 0.50,
                        //   decoration: BoxDecoration(border: Border.all(width: 2)),
                        child: TaskContentView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
