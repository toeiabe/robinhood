import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:robinhood/data/model/todo_model.dart';
import 'package:robinhood/domain/entities/task_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  Todo todoModel = Todo(tasks: [
    Task(
        id: "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
        title: "Read a book",
        description: "Spend an hour reading a book for pleasure",
        createdAt: DateTime.parse("2023-03-24T19:30:00Z"),
        status: Status.TODO),
    Task(
        id: "119a8c45-3f3d-41da-88bb-423c5367b81a",
        title: "Exercise",
        description: "Go for a run or do a workout at home",
        createdAt: DateTime.parse("2023-03-25T09:00:00Z"),
        status: Status.TODO)
  ], pageNumber: 0, totalPages: 16);

  List<TaskEntity> taskEntity = [
    TaskEntity(
        'cbb0732a-c9ab-4855-b66f-786cd41a3cd1',
        "Read a book",
        "Spend an hour reading a book for pleasure",
        DateTime.parse("2023-03-24T19:30:00Z"),
        Status.TODO),
    TaskEntity(
        "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "Exercise",
        "Go for a run or do a workout at home",
        DateTime.parse("2023-03-25T09:00:00Z"),
        Status.TODO)
  ];

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_task_response.json'),
    );

    //act
    final result = Todo.fromJson(jsonMap);

    //assert
    expect(result, equals(todoModel));
  });

  test(
    'should return a valid Entity',
    () async {
      // act
      final result = todoModel.tasks!.map((e) => e.toEntity());
      expect(result, equals(taskEntity));
    },
  );
}
