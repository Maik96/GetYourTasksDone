import 'package:doyourtasks/database/database_helper.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:doyourtasks/views/add_screen/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreenContent extends StatefulWidget {
  HomeScreenContent({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _navigateToAddScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => AddContentView()));
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                            color: Color.fromARGB(255, 9, 22, 180), width: 3),
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
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red, width: 3),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("4 tasks remaining",
                            style: TextStyle(fontSize: 19),
                            textAlign: TextAlign.left),
                      ),
                    ),
                    SizedBox(
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
                          _navigateToAddScreen(context);
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
                          width: size.width,
                          height: size.height * 0.50,
                          //   decoration: BoxDecoration(border: Border.all(width: 2)),
                          child: FutureBuilder<List<User>>(
                              future: DatabaseHelper.instance.getTasks(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<User>> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Text(' Loading'),
                                  );
                                }
                                return snapshot.data!.isEmpty
                                    ? Center(
                                        child: Text('No item'),
                                      )
                                    : ListView(
                                        children: snapshot.data!.map((item) {
                                        return Row(children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                      context, '/add',
                                                      arguments: item)
                                                  .then((value) =>
                                                      setState(() {}));
                                            },
                                            child: Text('Edit'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                DatabaseHelper.instance
                                                    .remove(item.id!);
                                              });
                                              _showSnackBar(context,
                                                  '${item.name} deleted.');
                                            },
                                            child: Text("Delete"),
                                          ),
                                          CheckboxListTile(
                                            title: Text(
                                              item.name,
                                              style: TextStyle(
                                                color: item.done
                                                    ? Colors.grey
                                                    : null,
                                                decoration: item.done
                                                    ? TextDecoration.lineThrough
                                                    : null,
                                              ),
                                            ),
                                            value: item.done,
                                            onChanged: (newValue) {
                                              setState(() {
                                                DatabaseHelper.instance.update(
                                                    item.copyWith(
                                                        done: newValue));
                                              });
                                            },
                                          ),
                                        ]);
                                      }).toList());

                                floatingActionButton:
                                FloatingActionButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/add',
                                            arguments: User(
                                                name: '',
                                                desc: '',
                                                done: false))
                                        .then((value) => setState(() {}));
                                  },
                                  child: Icon(Icons.add),
                                );
                              }),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            )));
  }
}
