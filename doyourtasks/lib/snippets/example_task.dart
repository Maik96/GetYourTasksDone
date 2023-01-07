import 'package:doyourtasks/assets/variables/variables.dart';
import 'package:flutter/material.dart';

class ExampleFact extends StatelessWidget {
  ExampleFact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.43,
        height: size.height * 0.20,
        decoration: BoxDecoration(
          color: Color.fromARGB(149, 255, 255, 255),
          borderRadius: BorderRadius.circular(37),
        ),
        child: Column(children: [
          Container(
            height: size.height * 0.14,
            width: 200,
            // decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: size.height * 0.035,
                  width: size.width * 0.5,
                  //   decoration: BoxDecoration(border: Border.all(width: 2)),
                  margin: const EdgeInsets.fromLTRB(17, 10, 5, 0),
                  child: Text(
                    "New dog toy",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.fromLTRB(17, 0, 10, 15),
                    child: Text(
                      "Getting a new toy for      my dog ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 134, 134, 134),
                        fontSize: size.height * 0.016,
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
            height: 40,
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
