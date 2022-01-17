import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_manager.dart';
import 'package:todoapp/routes/new_task_manager_route.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text("Tasks"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, NewTaskManagerRoute.routeName);
            },
          )
        ],
      ),
      body: Consumer<TaskManager>(
        builder: (context, taskManager, child) {
          return ListView.builder(
            itemCount: taskManager.tasks.length,
            itemBuilder: (context, index) {
              final task = taskManager.tasks[index];
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(task.isCompleted
                            ? Icons.check_circle
                            : Icons.check_circle_outline),
                        onPressed: () {
                          taskManager.updateTask(task);
                        },
                      ),
                      Text(task.title),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => taskManager.deleteData("s"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
