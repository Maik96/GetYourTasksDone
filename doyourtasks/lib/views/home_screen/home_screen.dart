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
                SizedBox(width: size.width, height: 60),
                Container(
                  width: size.width,
                  height: size.height * 0.20,
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
                      height: 80,
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
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //    border: Border.all(color: Colors.red, width: 3),
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
                              arguments: User(
                                name: '',
                                desc: '',
                                done: true,
                              )).then((value) => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.60,
                      width: size.width,
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: Color.fromARGB(255, 234, 234, 234)),
                      child: Column(children: [
                        Container(
                            alignment: Alignment.topCenter,
                            width: size.width,
                            height: size.height * 0.599,
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
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.emoji_emotions_outlined,
                                            size: 30,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Your tasks will appear here',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ],
                                      )
                                    : GridView.count(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 25,
                                        crossAxisSpacing: 15,
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 30, 15, 15),
                                        children: snapshot.data!.map((item) {
                                          return Container(
                                              width: 200,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    249, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(37),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    //      decoration: BoxDecoration(
                                                    //        border: Border.all(
                                                    //          color: Colors.red,
                                                    //        width: 1)),
                                                    height: 125,
                                                    width: 200,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: 10),
                                                        Container(
                                                          height: 25,
                                                          width: 200,
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  17, 10, 5, 0),
                                                          child: Text(
                                                            item.name,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  'Roboto',
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 7),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            width: 200,
                                                            margin: EdgeInsets
                                                                .fromLTRB(17, 0,
                                                                    10, 15),
                                                            child: Text(
                                                              item.desc,
                                                              style:
                                                                  const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        132,
                                                                        132,
                                                                        132),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Roboto',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    30))),
                                                    height: 54.5,
                                                    width: 200,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.delete,
                                                            size: 30,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    1,
                                                                    1),
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
                                                                    29,
                                                                    206,
                                                                    255),
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    48,
                                                                    121,
                                                                    255),
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


