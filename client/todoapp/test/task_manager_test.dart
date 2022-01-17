import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/task_manager.dart';

void main() {
  test("add task succesfully", () {
    final taskManager = TaskManager();
    final task = Task();
    taskManager.addListener(() {
      expect(taskManager.tasks.length, 1);
      expect(taskManager.tasks.contains(task), isTrue);
    });
    taskManager.add(task);
  });
  test("updates task succesfully", () {
    final taskManager = TaskManager();
    final task = Task();
    taskManager.add(task);

    taskManager.addListener(() {
      expect(task.isCompleted, isTrue);
    });

    taskManager.updateTask(task);
  });

  test("removes task succesfully", () {
    final taskManager = TaskManager ();
    final task = Task();
    
    taskManager.add(task);
    taskManager.addListener(() { 
      expect(taskManager.tasks.contains(task), isFalse);
    });
    taskManager.deleteTask(task);
  });
}
