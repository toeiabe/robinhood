part of 'done_bloc.dart';

enum DoneStatus { loading, success, error }

class DoneState extends Equatable {
  final DoneStatus status;
  final List<TaskEntity> dones;
  final bool hasReachedMax;
  final String errorMessage;

  const DoneState(
      {this.status = DoneStatus.loading,
      this.hasReachedMax = false,
      this.dones = const [],
      this.errorMessage = ""});

  DoneState copyWith({
    DoneStatus? status,
    List<TaskEntity>? dones,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return DoneState(
      status: status ?? this.status,
      dones: dones ?? this.dones,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, dones, hasReachedMax, errorMessage];
}
