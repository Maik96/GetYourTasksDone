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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: size.height,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 166, 210, 230)),
          child: Column(children: [
            SizedBox(width: size.width, height: 90),
            Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Row(children: [
                const SizedBox(
                    height: 40,
                    width: 150), // Wird nacher gefuellt mit einem Icon
                Container(
                  width: 180,
                  height: 100,
                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          afternoonText,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ]),
                ),
              ]),
            ),
            Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: size.height * 0.68,
                    width: size.width,
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80),
                        ),
                        color: Colors.white),
                    child: Column(
                      children: [
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
                                      width: 200,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
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
                                  const SizedBox(
                                    height: 30,
                                    width: 140,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 50,
                                      )),
                                ]),
                          ),
                        ),
                        SizedBox(height: 30, width: size.width),
                        Container(
                          width: size.width,
                          height: size.height * 0.45,
                          decoration:
                              BoxDecoration(border: Border.all(width: 3)),
                        ),
                      ],
                    )),
              ),
            ),
          ])),
    );
  }
}
