import 'dart:collection';

import 'package:flutter/material.dart';
import 'to_do_list.dart';
import 'list_display.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoList> toDoLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: _listBuilder(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('New List'),
        onPressed: () {
          _newList();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: toDoLists.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: FlatButton(
            child: Text(toDoLists[index].listName),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ListDisplay(toDoLists[index]);
                  }
                ),
              );
            },
          ),
        );
      }
    );
  }

  _newList() async {
    TextEditingController controller = TextEditingController();
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Enter List Name',
                    ),
                  )),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            FlatButton(
                child: const Text('Create'),
                onPressed: () {
                  Navigator.pop(context);
                  ToDoList newList = ToDoList(controller.text);
                  toDoLists.add(newList);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ListDisplay(newList);
                        }
                    ),
                  );
                })
          ],
        );
      }
    );
  }
}
