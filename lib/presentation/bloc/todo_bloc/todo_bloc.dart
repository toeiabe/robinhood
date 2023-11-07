import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/usecases/todo_usecase.dart';

import 'package:robinhood/injection.dart' as di;
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodo getTodos = di.locator<GetTodo>();
  int offset = 0;
  TodoBloc() : super(const TodoState()) {
    on<TodoEvent>((event, emit) async {
      if (event is TodoQuery) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == TodoStatus.loading) {
            final result = await getTodos.execute(offset);

            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(
                      status: TodoStatus.success, hasReachedMax: true))
                  : emit(state.copyWith(
                      status: TodoStatus.success,
                      todos: taskEntity,
                      hasReachedMax: false));
            }
          } else {
            final result = await getTodos.execute(offset);
            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      status: TodoStatus.success,
                      todos: List.of(state.todos)..addAll(taskEntity),
                      hasReachedMax: false));
            }
          }
        } catch (e) {
          emit(state.copyWith(
              status: TodoStatus.error, errorMessage: "failed to fetch Task"));
        }
      }
    }, transformer: droppable());
  }
}
