part of 'doing_bloc.dart';

@immutable
abstract class DoingEvent extends Equatable {
  const DoingEvent();

  @override
  List<Object> get props => [];
}

class DoingQuery extends DoingEvent {
  const DoingQuery();
}
