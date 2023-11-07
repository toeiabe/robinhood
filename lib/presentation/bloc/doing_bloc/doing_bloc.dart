import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/usecases/Doing_usecase.dart';

import 'package:robinhood/injection.dart' as di;
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'doing_event.dart';
part 'doing_state.dart';

class DoingBloc extends Bloc<DoingEvent, DoingState> {
  final GetDoing getDoings = di.locator<GetDoing>();
  int offset = 0;
  DoingBloc() : super(const DoingState()) {
    on<DoingEvent>((event, emit) async {
      if (event is DoingQuery) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == DoingStatus.loading) {
            final result = await getDoings.execute(offset);

            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(
                      status: DoingStatus.success, hasReachedMax: true))
                  : emit(state.copyWith(
                      status: DoingStatus.success,
                      doings: taskEntity,
                      hasReachedMax: false));
            }
          } else {
            final result = await getDoings.execute(offset);
            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      status: DoingStatus.success,
                      doings: List.of(state.doings)..addAll(taskEntity),
                      hasReachedMax: false));
            }
          }
        } catch (e) {
          emit(state.copyWith(
              status: DoingStatus.error, errorMessage: "failed to fetch Task"));
        }
      }
    }, transformer: droppable());
  }
}
