part of 'todo_bloc.dart';

enum TodoStatus { loading, success, error }

class TodoState extends Equatable {
  final TodoStatus status;
  final List<TaskEntity> todos;
  final bool hasReachedMax;
  final String errorMessage;

  const TodoState(
      {this.status = TodoStatus.loading,
      this.hasReachedMax = false,
      this.todos = const [],
      this.errorMessage = ""});

  TodoState copyWith({
    TodoStatus? status,
    List<TaskEntity>? todos,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, todos, hasReachedMax, errorMessage];
}
