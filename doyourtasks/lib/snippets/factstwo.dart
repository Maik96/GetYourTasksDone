import 'package:flutter/material.dart';

class FactsTwo extends StatelessWidget {
  FactsTwo({
    Key? key,
  }) : super(key: key);

  final String facttexttwo =
      "Everyday-Checking your task will improve your life.";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(249, 255, 255, 255),
        borderRadius: BorderRadius.circular(37),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 10),
          const Icon(
            Icons.lightbulb,
            size: 45,
            color: Colors.yellow,
          ),
          const SizedBox(height: 5),
          Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  const Text("Focus",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 10),
                  Text(
                    facttexttwo,
                    style: const TextStyle(),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
