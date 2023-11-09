import 'package:mockito/mockito.dart';
import 'package:robinhood/data/failure.dart';
import 'package:robinhood/data/model/todo_model.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/usecases/todo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late GetTodo getTodo;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getTodo = GetTodo(mockTaskRepository);
  });

  DateTime date = DateTime.now();
  var taskDetail = TaskEntity("1", "title", "description", date, Status.TODO);

  const offset = 0;

  test('should get TODO task detail from the repository', () async {
    // arrange
    Right<Failure, List<TaskEntity>?> mockResult = Right([taskDetail]);
    when(mockTaskRepository.getTodo(offset))
        .thenAnswer((_) async => mockResult);

    // act
    final result = await getTodo.execute(offset);

    // assert
    expect(result, mockResult);
  });

  test('should return a failure when the call fails', () async {
    // Arrange
    when(mockTaskRepository.getTodo(offset))
        .thenAnswer((_) async => Left(ServerFailure('An error has occurred')));

    // Act
    final result = await getTodo.execute(offset);

    // Assert
    expect(result, Left(ServerFailure('An error has occurred')));
  });
}
