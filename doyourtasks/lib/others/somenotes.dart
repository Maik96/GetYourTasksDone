Flexible(
                                          child: Row(children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                        context, '/add',
                                                        arguments: item) //Test
                                                    .then((value) =>
                                                        setState(() {}));
                                              },
                                              child: const Text('Edit'),
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
                                              child: new Flexible(
                                                child: const Text("Delete"),
                                              ),
                                            ),
                                            Expanded(
                                              child: CheckboxListTile(
                                                title: Flexible(
                                                  child: Text(
                                                    item.name,
                                                    style: TextStyle(
                                                      color: item.done
                                                          ? Colors.grey
                                                          : null,
                                                      decoration: item.done
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                                value: item.done,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    DatabaseHelper.instance
                                                        .update(item.copyWith(
                                                            done: newValue));
                                                  });
                                                },
                                              ),
                                            ),
                                          ]),
                                        );