import 'dart:convert';
import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:doyourtasks/views/add_screen/add_screen.dart';
import 'package:doyourtasks/views/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _navigateToAddScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const AddContentView()));
}

class _HomeScreenState extends State<HomeScreenContent> {
  String name = "Hi there";
  String afternoonText = "Good afternoon";

  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

    dynamic monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

    return json.decode(dayData)['${date.weekday}'] +
        ", " +
        date.day.toString() +
        " " +
        json.decode(monthData)['${date.month}'] +
        " " +
        date.year.toString();
  }

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
                      decoration: const BoxDecoration(
                        // border: Border.all(width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      height: 120,
                      width: 120,
                      child:
                          Image.asset('assets/images/RockYourTasksRound.png'),
                    ),
                    // Wird nacher gefuellt mit einem Icon
                    // ignore: sized_box_for_whitespace
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
                      child: Center(
                          child: Text(
                        dateFormatter(DateTime.now()),
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                    // ignore: sized_box_for_whitespace
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
                                                color: const Color.fromARGB(
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
                                                          margin:
                                                              const EdgeInsets
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
                                                            margin:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    17,
                                                                    0,
                                                                    10,
                                                                    15),
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
                                                          icon: const Icon(
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
                                                          icon: const Icon(
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
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ));
                                        }).toList(),
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
