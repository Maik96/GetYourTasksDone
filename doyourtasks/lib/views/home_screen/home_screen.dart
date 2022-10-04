import 'package:doyourtasks/views/add_screen/add_conent_view.dart';
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
            const BoxDecoration(color: Color.fromARGB(250, 73, 41, 162)),
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
                  decoration: const BoxDecoration(
                      // border: Border.all(width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  height: 120,
                  width: 120,
                  //    child: const Icon(
                  //    Icons.boy,
                  //  color: Colors.black,
                  // size: 90,
                  //  ),
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
            SizedBox(
              height: 30,
            ),
            Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.67,
                  width: size.width,
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 7,
                      ),
                      Align(
                        child: Container(
                          width: size.width,
                          height: size.height * 0.1,
                          decoration: const BoxDecoration(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 100,
                                    width: size.width * 0.5,
                                    decoration: BoxDecoration(
                                        //  border: Border.all(width: 1)
                                        ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Your tasks",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text("4 tasks remaining",
                                            textAlign: TextAlign.center),
                                      ],
                                    )),
                                Container(
                                  decoration: const BoxDecoration(
                                      // border: Border.all(width: 2),
                                      ),
                                  height: 10,
                                  width: size.width * 0.18,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      // border: Border.all(width: 1)
                                      ),
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 50,
                                    ),
                                    color: Colors.black,
                                    onPressed: () {
                                      _navigateToAddScreen(context);
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(height: 20, width: size.width),
                      Container(
                        width: size.width,
                        height: size.height * 0.45,
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
