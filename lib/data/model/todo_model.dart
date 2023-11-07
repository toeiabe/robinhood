import 'package:robinhood/domain/entities/task_entity.dart';

class Todo {
  List<Task>? tasks;
  int? pageNumber;
  int? totalPages;

  Todo({
    required this.tasks,
    required this.pageNumber,
    required this.totalPages,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Task>[];
      json['tasks'].forEach((v) {
        tasks!.add(Task.fromJson(v));
      });
    }

    pageNumber = json["pageNumber"];
    totalPages = json["totalPages"];
  }
}

class Task {
  String? id;
  String? title;
  String? description;
  DateTime? createdAt;
  Status? status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = DateTime.parse(json['createdAt']);
    status = Status.values
        .firstWhere((e) => e.toString() == 'Status.' + json['status']);
  }

  TaskEntity toEntity() =>
      TaskEntity(id!, title!, description!, createdAt!, status!);
}

enum Status { DOING, DONE, TODO }
