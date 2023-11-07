part of 'done_bloc.dart';

@immutable
abstract class DoneEvent extends Equatable {
  const DoneEvent();

  @override
  List<Object> get props => [];
}

class DoneQuery extends DoneEvent {
  const DoneQuery();
}
