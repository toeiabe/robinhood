import 'package:robinhood/domain/entities/task_entity.dart';

import '../../data/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>?>> getTodo(int offset);
  Future<Either<Failure, List<TaskEntity>?>> getDoing(int offset);
  Future<Either<Failure, List<TaskEntity>?>> getDone(int offset);
}
