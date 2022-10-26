import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';

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
    bool inEditMode = editedTaskItem.name != '';

    if (inEditMode) {
      nameController.text = editedTaskItem.name;
      descController.text = editedTaskItem.name;
    }

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              height: 130,
              width: size.width,
              child: Image.asset(
                'assets/images/RockYourTasks.png',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: size.width * 0.9,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "New task",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 370,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "What's the name of the task?",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 120,
              width: 370,
              child: TextField(
                controller: descController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Describe your task",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (inEditMode) {
                    await DatabaseHelper.instance.update(User(
                      name: nameController.text,
                      desc: descController.text,
                      id: editedTaskItem.id,
                    ));
                  } else {
                    await DatabaseHelper.instance.add(User(
                        name: nameController.text,
                        desc: descController.text,
                        id: editedTaskItem.id));
                  }

                  nameController.clear();
                  descController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Let's rock your tasks",
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(250, 20, 98, 233),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 23),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navigateToHomeScreen(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 23),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2, color: Color.fromARGB(250, 20, 98, 233)),
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "Get back",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
