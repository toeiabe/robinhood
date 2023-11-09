import 'package:equatable/equatable.dart';

import 'package:robinhood/data/model/todo_model.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final Status status;

  const TaskEntity(
      this.id, this.title, this.description, this.createdAt, this.status);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
