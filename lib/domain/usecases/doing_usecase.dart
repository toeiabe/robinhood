import 'package:dartz/dartz.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/repositories/repository.dart';

import '../../data/failure.dart';

class GetDoing {
  final TaskRepository repository;

  GetDoing(this.repository);

  Future<Either<Failure, List<TaskEntity>?>> execute(int offset) async {
    return await repository.getDoing(offset);
  }
}
