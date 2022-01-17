import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_manager.dart';

class NewTaskManagerScreen extends StatelessWidget {
  NewTaskManagerScreen({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Add Task"),
      ),
      body: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: "Ex. add sth"),
        onSubmitted: (text) { _controller.clear();
          Provider.of<TaskManager>(context,listen:false).deleteData(text);
        }
      ),
    );
  }
}
