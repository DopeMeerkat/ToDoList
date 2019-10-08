import 'package:flutter/material.dart';
import 'to_do_list.dart';

class ListDisplay extends StatefulWidget {
  final ToDoList list;

  ListDisplay(this.list);

  @override
  _ListDisplayState createState() => _ListDisplayState();

}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.listName),
      ),
      body: _taskBuilder(),
    );
  }

  Widget _taskBuilder() {
    return ListView.builder(
        itemCount: widget.list.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.list.tasks[index].name),
            ],
          );
        }
    );
  }
}