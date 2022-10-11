import 'package:flutter/material.dart';

class TaskContentView extends StatelessWidget {
  const TaskContentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 0,
      children: List.generate(10, (index) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 9, 22, 180),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      const SizedBox(height: 20, width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Beispiel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Beschreibung",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}
