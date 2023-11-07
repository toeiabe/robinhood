import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:robinhood/data/datasource/remote_datasource.dart';
import 'package:robinhood/data/exception.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/repositories/repository.dart';

import '../failure.dart';

class TaskRepositoryImpl implements TaskRepository {
  final RemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TaskEntity>?>> getTodo(int offset) async {
    try {
      final result = await remoteDataSource.getTodo(offset);
      return Right(result.tasks?.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>?>> getDoing(int offset) async {
    try {
      final result = await remoteDataSource.getDoing(offset);
      return Right(result.tasks?.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>?>> getDone(int offset) async {
    try {
      final result = await remoteDataSource.getDone(offset);
      return Right(result.tasks?.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
