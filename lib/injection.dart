import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:robinhood/data/repositories/repositories_impl.dart';
import 'package:robinhood/domain/repositories/repository.dart';
import 'package:robinhood/domain/usecases/Doing_usecase.dart';

import 'package:robinhood/domain/usecases/todo_usecase.dart';
import 'package:robinhood/presentation/bloc/doing_bloc/doing_bloc.dart';
import 'package:robinhood/presentation/bloc/done_bloc/done_bloc.dart';
import 'package:robinhood/presentation/bloc/todo_bloc/todo_bloc.dart';

import 'package:robinhood/data/datasource/remote_datasource.dart';
import 'domain/usecases/Done_usecase.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => TodoBloc());
  locator.registerFactory(() => DoingBloc());
  locator.registerFactory(() => DoneBloc());

  // usecase
  locator.registerLazySingleton(() => GetTodo(locator()));
  locator.registerLazySingleton(() => GetDoing(locator()));
  locator.registerLazySingleton(() => GetDone(locator()));

  // repository
  locator.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
