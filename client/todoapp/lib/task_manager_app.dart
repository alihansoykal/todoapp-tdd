import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/routes/new_task_manager_route.dart';
import 'package:todoapp/screens/new_task_manager_screen.dart';
import 'package:todoapp/screens/task_manager_screen.dart';

import 'models/task_manager.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskManager(),
      child: MaterialApp(
        title: "Task Manager",
        debugShowCheckedModeBanner: false,
        home: TaskManagerScreen(),
        routes: {
          NewTaskManagerRoute.routeName: (context) => NewTaskManagerScreen()
        },
      ),
    );
  }
}
