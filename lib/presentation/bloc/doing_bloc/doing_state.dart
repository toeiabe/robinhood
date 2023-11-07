part of 'doing_bloc.dart';

enum DoingStatus { loading, success, error }

class DoingState extends Equatable {
  final DoingStatus status;
  final List<TaskEntity> doings;
  final bool hasReachedMax;
  final String errorMessage;

  const DoingState(
      {this.status = DoingStatus.loading,
      this.hasReachedMax = false,
      this.doings = const [],
      this.errorMessage = ""});

  DoingState copyWith({
    DoingStatus? status,
    List<TaskEntity>? doings,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return DoingState(
      status: status ?? this.status,
      doings: doings ?? this.doings,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, doings, hasReachedMax, errorMessage];
}
