import 'dart:io';
import 'dart:math';
import 'package:const_date_time/const_date_time.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:robinhood/data/exception.dart';
import 'package:robinhood/data/failure.dart';
import 'package:robinhood/data/model/todo_model.dart';
import 'package:robinhood/data/repositories/repositories_impl.dart';
import 'package:robinhood/domain/entities/task_entity.dart';

import '../../helpers/test_helpers.mocks.dart';
import 'package:matcher/matcher.dart';
import 'package:collection/collection.dart';

Matcher equalsRightWithSameList(List<TaskEntity> expectedList) {
  return CustomMatcher('Right with same list', 'Right', (actual) {
    if (actual is! d.Either) {
      return false;
    }

    final actualRight = actual as d.Either;
    if (actualRight.isRight()) {
      final actualList = actualRight.getOrElse(() =>
          <TaskEntity>[]); // Provide a default value of an empty list with the correct type.
      return const ListEquality().equals(expectedList, actualList);
    }

    return false;
  });
}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late TaskRepositoryImpl taskRepositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    taskRepositoryImpl = TaskRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  const date1 = ConstDateTime.utc(2022);
  const date2 = ConstDateTime.utc(2023);

  var todoModel = Todo(tasks: [
    Task(
        id: "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
        title: "Read a book",
        description: "Spend an hour reading a book for pleasure",
        createdAt: date1,
        status: Status.TODO),
    Task(
        id: "119a8c45-3f3d-41da-88bb-423c5367b81a",
        title: "Exercise",
        description: "Go for a run or do a workout at home",
        createdAt: date2,
        status: Status.TODO)
  ], pageNumber: 0, totalPages: 16);

  const taskEntity = [
    TaskEntity('cbb0732a-c9ab-4855-b66f-786cd41a3cd1', "Read a book",
        "Spend an hour reading a book for pleasure", date1, Status.TODO),
    TaskEntity("119a8c45-3f3d-41da-88bb-423c5367b81a", "Exercise",
        "Go for a run or do a workout at home", date2, Status.TODO)
  ];
  const offset = 0;

  group('get Todo', () {
    test(
      'should return todos when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTodo(offset))
            .thenAnswer((_) async => todoModel);

        // act
        final result = await taskRepositoryImpl.getTodo(offset);

        // assert
        // expect(result, equals(d.right<Failure, List<TaskEntity>>([])));
        expect(result, equalsRightWithSameList(taskEntity));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getTodo(offset)).thenThrow(ServerException());

        // act
        final result = await taskRepositoryImpl.getTodo(offset);

        // assert
        expect(result,
            equals(const d.Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getTodo(offset)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await taskRepositoryImpl.getTodo(offset);

        // assert
        expect(
            result,
            equals(const d.Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });

  group('get Doing', () {
    test(
      'should return doings when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDoing(offset))
            .thenAnswer((_) async => todoModel);

        // act
        final result = await taskRepositoryImpl.getDoing(offset);

        // assert
        // expect(result, equals(d.right<Failure, List<TaskEntity>>([])));
        expect(result, equalsRightWithSameList(taskEntity));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDoing(offset))
            .thenThrow(ServerException());

        // act
        final result = await taskRepositoryImpl.getDoing(offset);

        // assert
        expect(result,
            equals(const d.Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getDoing(offset)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await taskRepositoryImpl.getDoing(offset);

        // assert
        expect(
            result,
            equals(const d.Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });

  group('get Done', () {
    test(
      'should return todos when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDone(offset))
            .thenAnswer((_) async => todoModel);

        // act
        final result = await taskRepositoryImpl.getDone(offset);

        // assert
        // expect(result, equals(d.right<Failure, List<TaskEntity>>([])));
        expect(result, equalsRightWithSameList(taskEntity));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getDone(offset)).thenThrow(ServerException());

        // act
        final result = await taskRepositoryImpl.getDone(offset);

        // assert
        expect(result,
            equals(const d.Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getDone(offset)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result = await taskRepositoryImpl.getDone(offset);

        // assert
        expect(
            result,
            equals(const d.Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}
