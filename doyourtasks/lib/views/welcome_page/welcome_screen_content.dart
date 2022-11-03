import 'package:doyourtasks/views/home_screen/home_screen_content.dart';
import 'package:flutter/material.dart';

class WelcomeScreenContent extends StatelessWidget {
  const WelcomeScreenContent({super.key});

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String InfoText =
        "With RockYourTasks you will get your tasks done so quickly.";
    final String InfoTextTwo = "We only ask you about your name.";
    final String InfoTextThree =
        "All your tasks will always remain on your device only. We promise!";

    TextEditingController usernameController = TextEditingController(text: '');

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: Colors.white),
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
                height: 170,
                width: size.width * 0.9,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Introduce",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("yourself",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 65,
                width: 370,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    fillColor: Color.fromARGB(255, 234, 234, 234),
                    hintText: "What's your name?",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: size.width * 0.9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        InfoText,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                        width: 100,
                      ),
                      Text(
                        InfoTextTwo,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                      Text(InfoTextThree, style: const TextStyle(fontSize: 18)),
                    ],
                  )),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(250, 20, 98, 233),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _navigateToNextScreen(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: const Color.fromARGB(255, 255, 255, 255),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 23),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            "Let's rock your tasks",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
