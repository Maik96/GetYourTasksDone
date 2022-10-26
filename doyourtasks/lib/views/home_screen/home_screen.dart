import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:doyourtasks/views/add_screen/add_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatefulWidget {
  HomeScreenContent({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _navigateToAddScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const AddContentView()));
}

class _HomeScreenState extends State<HomeScreenContent> {
  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  String name = "Hi Maik";
  String afternoonText = "Good afternoon";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            decoration:
                const BoxDecoration(color: Color.fromARGB(250, 20, 98, 233)),
            child: Column(
              children: [
                SizedBox(width: size.width, height: 80),
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Row(children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(width: 2),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      height: 120,
                      width: 120,
                      child:
                          Image.asset('assets/images/RockYourTasksRound.png'),
                    ),
                    // Wird nacher gefuellt mit einem Icon
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 2)),
                      width: 180,
                      height: 120,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              afternoonText,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 211, 211, 211),
                                fontFamily: 'Roboto',
                                fontSize: 20,
                              ),
                            ),
                          ]),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red, width: 3),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text("4 tasks remaining",
                            style: TextStyle(fontSize: 19),
                            textAlign: TextAlign.left),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                    Container(
                      height: 80,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 70,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/add',
                                  arguments:
                                      User(name: '', desc: '', done: true))
                              .then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.55,
                      width: size.width,
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: Colors.white),
                      child: Column(children: [
                        Container(
                            alignment: Alignment.topCenter,
                            width: size.width,
                            height: size.height * 0.50,
                            //   decoration: BoxDecoration(border: Border.all(width: 2)),
                            child: FutureBuilder<List<User>>(
                              future: DatabaseHelper.instance.getTasks(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<User>> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text(' Loading'),
                                  );
                                }
                                return snapshot.data!.isEmpty
                                    ? const Center(
                                        child: Text('No item'),
                                      )
                                    : GridView.count(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15,
                                        padding: const EdgeInsets.all(15),
                                        children: snapshot.data!.map((item) {
                                          return Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 32, 214, 255),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    //  decoration: BoxDecoration(
                                                    //  border: Border.all(
                                                    //    color: Colors.red,
                                                    //   width: 1)),
                                                    height: 135,
                                                    width: 190,

                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: 20),
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  20, 0, 20, 0),
                                                          child: Text(
                                                            item.name,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            width: 200,
                                                            margin: EdgeInsets
                                                                .fromLTRB(10, 0,
                                                                    0, 0),
                                                            child: Text(
                                                              item.desc,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    //    decoration: BoxDecoration(
                                                    //        border: Border.all(
                                                    //            color: Colors.red,
                                                    //           width: 1)),
                                                    height: 40,
                                                    width: 200,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.delete,
                                                            size: 30,
                                                            color: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              DatabaseHelper
                                                                  .instance
                                                                  .remove(
                                                                      item.id!);
                                                            });
                                                          },
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.edit,
                                                            size: 30,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    62,
                                                                    25,
                                                                    228),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pushNamed(
                                                                    context,
                                                                    '/add',
                                                                    arguments:
                                                                        item) //Test
                                                                .then((value) =>
                                                                    setState(
                                                                        () {}));
                                                          },
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.done,
                                                            size: 35,
                                                            color: Colors.green,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              DatabaseHelper
                                                                  .instance
                                                                  .remove(
                                                                      item.id!);
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ));
                                        }).toList(),
                                      );
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            )),
                      ]),
                    ),
                  ),
                ),
              ],
            )));
  }
}

// snapshot.data!map(item)