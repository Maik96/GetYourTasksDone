import 'package:doyourtasks/assets/variables/variables.dart';
import 'package:flutter/material.dart';

class ExampleFact extends StatelessWidget {
  ExampleFact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(149, 255, 255, 255),
          borderRadius: BorderRadius.circular(37),
        ),
        child: Column(children: [
          Container(
            height: 140,
            width: 200,
            // decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 25,
                  width: 200,
                  //   decoration: BoxDecoration(border: Border.all(width: 2)),
                  margin: const EdgeInsets.fromLTRB(17, 10, 5, 0),
                  child: Text(
                    "New dog toy",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.fromLTRB(17, 0, 10, 15),
                    child: Text(
                      "Getting a new toy for      my dog ",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 200,
            //     decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Color.fromARGB(255, 1, 1, 1),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.done,
                    size: 35,
                    color: Color.fromARGB(255, 48, 121, 255),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ]));
  }
}
