import 'dart:convert';
import 'package:http/http.dart' as http;
import '../exception.dart';
import 'package:robinhood/data/model/todo_model.dart';

abstract class RemoteDataSource {
  Future<Todo> getTodo(int offset);
  Future<Todo> getDoing(int offset);
  Future<Todo> getDone(int offset);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<Todo> getTodo(int offset) async {
    final response = await client.get(Uri.parse(
        "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=TODO"));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Todo.fromJson(body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Todo> getDoing(int offset) async {
    final response = await client.get(Uri.parse(
        "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DOING"));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Todo.fromJson(body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Todo> getDone(int offset) async {
    final response = await client.get(Uri.parse(
        "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list?offset=$offset&limit=10&sortBy=createdAt&isAsc=true&status=DONE"));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return Todo.fromJson(body);
    } else {
      throw ServerException();
    }
  }
}
