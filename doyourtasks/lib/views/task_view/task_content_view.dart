import 'package:flutter/material.dart';

class TaskContentView extends StatelessWidget {
  const TaskContentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(10, (index) {
        return Center(
          child: Text("Test"),
        );
      }),
    );
  }
}
