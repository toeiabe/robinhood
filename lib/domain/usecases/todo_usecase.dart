import 'package:dartz/dartz.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/repositories/repository.dart';

import 'package:robinhood/data/failure.dart';

class GetTodo {
  final TaskRepository repository;

  GetTodo(this.repository);

  Future<Either<Failure, List<TaskEntity>?>> execute(int offset) async {
    return await repository.getTodo(offset);
  }
}
