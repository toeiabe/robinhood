import 'package:equatable/equatable.dart';
import 'package:robinhood/domain/entities/task_entity.dart';

class Todo extends Equatable {
  final List<Task> tasks;
  final int pageNumber;
  final int totalPages;

  Todo({
    required this.tasks,
    required this.pageNumber,
    required this.totalPages,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    var tempTasks = <Task>[];
    json['tasks'].forEach((v) => tempTasks.add(Task.fromJson(v)));
    return Todo(
        tasks: tempTasks,
        pageNumber: json["pageNumber"],
        totalPages: json["totalPages"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [tasks, pageNumber, totalPages];
}

class Task extends TaskEntity {
  Task({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required Status status,
  }) : super(id, title, description, createdAt, status);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      status: Status.values
          .firstWhere((e) => e.toString() == 'Status.' + json['status']));

  TaskEntity toEntity() =>
      TaskEntity(id, title, description, createdAt, status);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, createdAt, status];
}

enum Status { DOING, DONE, TODO }
