import 'package:flutter/material.dart';
import 'to_do_list.dart';
import 'task.dart';

class ListDisplay extends StatefulWidget {
  final ToDoList list;

  ListDisplay(this.list);

  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.listName),
        actions: <Widget>[],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _taskBuilder(),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter new issue',
              ),
              onSubmitted: (newStr) {
                controller.clear();
                widget.list.tasks.add(Task(newStr));
              },
            ),
          ],
        ),
      ),

    );
  }

  Widget _taskBuilder() {
    return ListView.builder(
        itemCount: widget.list.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '- ' + widget.list.tasks[index].name,
                style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 20),
              ),
            ],
          );
        });
  }
}
