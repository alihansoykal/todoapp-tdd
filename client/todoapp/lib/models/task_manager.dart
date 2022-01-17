import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todoapp/models/task.dart';
import 'package:http/http.dart' as http;

class TaskManager extends ChangeNotifier {
  final httpClient = http.Client();
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addE(final Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  Future updateTask(final Task task) async{
    final Uri restAPIURL = Uri.parse("https://tdd-todoapp.herokuapp.com/put");
    http.Response response = await httpClient.put(restAPIURL,headers: customHeaders,body: jsonEncode(<String, bool>{
      'isCompleted': !task.isCompleted,
    }));
    task.isCompleted = !task.isCompleted;
    notifyListeners();
    return response.body;
  }

  void deleteTask(final Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  Future add(final Task task) async {
    final Uri restAPIURL = Uri.parse("https://tdd-todoapp.herokuapp.com/add");
    http.Response response = await httpClient.post(restAPIURL,
        headers: customHeaders, body: jsonEncode(task));
    _tasks.add(task);
    notifyListeners();
    return response.body;
  }

  Future deleteData(String id) async {
    final Uri restAPIURL =
    Uri.parse("https://tdd-todoapp.herokuapp.com/delete");
    http.Response response = await httpClient
        .delete(restAPIURL, headers: customHeaders, body: jsonEncode({"_id": id}));
    return response.body;
  }
}
