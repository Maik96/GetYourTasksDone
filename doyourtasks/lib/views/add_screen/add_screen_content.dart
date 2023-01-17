import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:doyourtasks/snippets/factsone.dart';
import 'package:doyourtasks/snippets/factstwo.dart';

import 'package:flutter/material.dart';

import '../home_screen/home_screen_content.dart';

class AddScreenContent extends StatefulWidget {
  const AddScreenContent({Key? key}) : super(key: key);

  @override
  _AddScreenContentState createState() => _AddScreenContentState();
}

class _AddScreenContentState extends State<AddScreenContent> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController descController = TextEditingController(text: '');

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final editedTaskItem = ModalRoute.of(context)!.settings.arguments as User;
    bool inEditMode = editedTaskItem.name != '' && editedTaskItem.desc != '';

    if (inEditMode) {
      nameController.text = editedTaskItem.name;
      descController.text = editedTaskItem.desc;
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          height: size.height,
          width: size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Column(
            children: [
              const SizedBox(height: 90),
              // ignore: sized_box_for_whitespace
              Container(
                height: 124,
                width: size.width * 0.9,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "New One",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: const [
                            Text("Get it off your mind",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 133, 133),
                                  fontSize: 18,
                                )),
                            SizedBox(width: 10),
                            Icon(
                              Icons.emoji_emotions_outlined,
                              size: 30,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.760,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 234, 234, 234),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Column(children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 65,
                    width: 370,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        fillColor: Colors.white,
                        hintText: "What's the name of the task?",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 120,
                    width: 370,
                    child: TextField(
                      controller: descController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 4,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Describe your task",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _navigateToHomeScreen(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(180, 60),
                            maximumSize: const Size(180, 60),
                            primary: const Color.fromARGB(255, 255, 255, 255),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "back",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (nameController.text.isNotEmpty &&
                              nameController.text != " " &&
                              nameController.text != "  ") {
                            if (inEditMode) {
                              await DatabaseHelper.instance.update(User(
                                  name: nameController.text,
                                  desc: descController.text,
                                  id: editedTaskItem.id));
                            } else {
                              await DatabaseHelper.instance.add(User(
                                name: nameController.text,
                                desc: descController.text,
                              ));
                            }

                            nameController.clear();
                            descController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Done",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(180, 60),
                            maximumSize: const Size(180, 60),
                            primary: const Color.fromARGB(250, 20, 98, 233),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "Facts",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FactsInfoOne(),
                      const SizedBox(width: 20),
                      FactsTwo(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
