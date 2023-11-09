import 'package:mockito/mockito.dart';
import 'package:robinhood/data/failure.dart';
import 'package:robinhood/data/model/todo_model.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/usecases/Done_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late GetDone getDone;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getDone = GetDone(mockTaskRepository);
  });

  DateTime date = DateTime.now();
  var taskDetail = TaskEntity("1", "title", "description", date, Status.DONE);

  const offset = 0;

  test('should get DONE task detail from the repository', () async {
    // arrange
    Right<Failure, List<TaskEntity>?> mockResult = Right([taskDetail]);
    when(mockTaskRepository.getDone(offset))
        .thenAnswer((_) async => mockResult);

    // act
    final result = await getDone.execute(offset);

    // assert
    expect(result, mockResult);
  });
}
