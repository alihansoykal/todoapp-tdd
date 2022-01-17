
class Task {
  final String title;
  bool isCompleted;
  final String id;

  Task({this.title = "", this.isCompleted = false,this.id=""});

  Map toJson() => {
    'title': title,
    'isCompleted': true,
    "_id":id,
  };
}