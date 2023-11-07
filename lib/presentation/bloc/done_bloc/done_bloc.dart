import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/domain/usecases/Done_usecase.dart';

import 'package:robinhood/injection.dart' as di;
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'done_event.dart';
part 'done_state.dart';

class DoneBloc extends Bloc<DoneEvent, DoneState> {
  final GetDone getDones = di.locator<GetDone>();
  int offset = 0;
  DoneBloc() : super(const DoneState()) {
    on<DoneEvent>((event, emit) async {
      if (event is DoneQuery) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == DoneStatus.loading) {
            final result = await getDones.execute(offset);

            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(
                      status: DoneStatus.success, hasReachedMax: true))
                  : emit(state.copyWith(
                      status: DoneStatus.success,
                      dones: taskEntity,
                      hasReachedMax: false));
            }
          } else {
            final result = await getDones.execute(offset);
            if (result.isRight()) {
              List<TaskEntity>? taskEntity =
                  result.getOrElse(() => throw UnimplementedError());
              offset++;
              return taskEntity!.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      status: DoneStatus.success,
                      dones: List.of(state.dones)..addAll(taskEntity),
                      hasReachedMax: false));
            }
          }
        } catch (e) {
          emit(state.copyWith(
              status: DoneStatus.error, errorMessage: "failed to fetch Task"));
        }
      }
    }, transformer: droppable());
  }
}
