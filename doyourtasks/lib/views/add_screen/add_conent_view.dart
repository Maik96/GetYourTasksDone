import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:doyourtasks/views/welcome_page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddContentView extends StatelessWidget {
  const AddContentView({super.key});

  void _navigateToHomeScreenAfterAdd(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 101, 203, 250)),
          child: Column(
            children: [
              Container(
                height: 160,
                width: size.width,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 50),
                  color: Colors.black,
                  onPressed: () {
                    _navigateToHomeScreenAfterAdd(context);
                  },
                ),
              ),
              Container(
                height: 200,
              ),
              Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(children: [
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3),
                      ),
                      child: const Text("New Task"),
                    ),
                    const SizedBox(
                      height: 50,
                      width: 200,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(border: Border.all(width: 3)),
                    ),
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("name"),
                  const TextField(),
                  const Text("describtion"),
                  const TextField(),
                  IconButton(
                    icon: Icon(Icons.add, size: 50),
                    color: Colors.black,
                    onPressed: () {
                      _navigateToHomeScreenAfterAdd(context);
                    },
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
