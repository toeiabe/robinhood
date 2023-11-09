import 'package:bloc_test/bloc_test.dart';
import 'package:const_date_time/const_date_time.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:robinhood/data/failure.dart';
import 'package:robinhood/data/model/todo_model.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/presentation/bloc/done_bloc/done_bloc.dart';

import '../../helpers/test_helpers.mocks.dart';
import '../../../lib/injection.dart' as di;

void main() {
  late MockGetDone mockGetDoneUsecase;
  late DoneBloc doneBloc;

  setUp(() {
    di.init();
    mockGetDoneUsecase = MockGetDone();
    doneBloc = DoneBloc();
  });

  const date = ConstDateTime.utc(2023);
  var testTaskEntities = [
    TaskEntity(
        "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
        "Read a book",
        " Spend an hour reading a book for pleasure",
        DateTime.parse("2023-03-24 19:30:00.000Z"),
        Status.DONE),
    TaskEntity(
        "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "Exercise",
        "Go for a run or do a workout at home",
        DateTime.parse("2023-03-25 09:00:00.000Z"),
        Status.DONE),
    TaskEntity(
        "ab7e3eb3-058d-44de-bb97-01b35d2b2c29",
        "Pay bills",
        "Pay monthly bills and schedule future payments",
        DateTime.parse("2023-03-25 14:00:00.000Z"),
        Status.DONE),
    TaskEntity(
        "67cbf4e4-c81e-4c8e-aa1e-6efc7e75b0a8",
        " Write a letter",
        "Write a letter to a family member or friend",
        DateTime.parse("2023-03-27 15:45:00.000Z"),
        Status.DONE),
    TaskEntity(
        "c59ca7e3-d158-4f9a-b4db-618926a4f5d5",
        "Clean the kitchen",
        "Clean the countertops, sink, and stovetop",
        DateTime.parse("2023-03-28 12:30:00.000Z"),
        Status.DONE),
    TaskEntity(
        "8992a148-74db-49de-877a-691be7cb9c9f",
        " Try a new recipe",
        "Find a new recipe to try for dinner",
        DateTime.parse("2023-03-28 18:00:00.000Z"),
        Status.DONE),
    TaskEntity(
        "09eaa2d7-c9b9-429e-94fb-8426b68df6e1",
        "Call a friend",
        "Catch up with a friend over the phone",
        DateTime.parse("2023-03-30 16:15:00.000Z"),
        Status.DONE),
    TaskEntity(
        "1b9c0030-6c96-4d1b-9c63-1d8ec7b49fa6",
        "Take a walk",
        " Go for a walk outside and enjoy the fresh air",
        DateTime.parse("2023-03-31 11:45:00.000Z"),
        Status.DONE),
    TaskEntity(
        "b36c4603-3d22-4f06-8e70-04af4b4c4f79",
        "Organize bookshelf",
        "Sort books by genre and alphabetize",
        DateTime.parse("2023-04-01 10:30:00.000Z"),
        Status.DONE),
    TaskEntity(
        "1cb357aa-78e9-46a3-a012-46250b1a15b7",
        "Do laundry",
        " Wash and fold clothes that have piled up",
        DateTime.parse("2023-04-01 13:00:00.000Z"),
        Status.DONE)
  ];
  const offset = 0;

  test('initial state should be loading', () {
    expect(DoneBloc().state, DoneState(status: DoneStatus.loading));
  });

  blocTest<DoneBloc, DoneState>(
      'should emit [Success] when data is gotten successfully',
      build: () {
        when(mockGetDoneUsecase.execute(offset))
            .thenAnswer((_) async => Right(testTaskEntities));

        return doneBloc;
      },
      act: (bloc) => bloc.add(DoneQuery()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            DoneState(
                status: DoneStatus.success,
                dones: testTaskEntities,
                hasReachedMax: false)
          ]);

  blocTest<DoneBloc, DoneState>(
      'should emit [Error] when get data is unsuccessful',
      setUp: () {
        when(mockGetDoneUsecase.execute(offset)).thenAnswer(
            (_) async => Future.value(Left(ServerFailure("error"))));
      },
      build: () {
        return doneBloc;
      },
      act: (bloc) => bloc.add(DoneQuery()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
            const DoneState(status: DoneStatus.error),
          ]);
}
