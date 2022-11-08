import 'package:flutter/material.dart';

class FactsInfoOne extends StatelessWidget {
  FactsInfoOne({
    Key? key,
  }) : super(key: key);

  final String facttextone = "Get it off your mind. Don't miss any task again.";

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
            Icons.rule,
            size: 45,
            color: Colors.blue,
          ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                const Text("Remember",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 10),
                Text(
                  facttextone,
                  // textAlign: TextAlign.left,
                  style: const TextStyle(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
