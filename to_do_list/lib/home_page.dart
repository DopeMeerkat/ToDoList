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
        tooltip: 'New List',

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: toDoLists.length,
      itemBuilder: (BuildContext context, int index) {
        return Expanded(
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
}
