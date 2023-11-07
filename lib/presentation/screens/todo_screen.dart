import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:intl/intl.dart';
import 'package:robinhood/utils/extension.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _scrollController = ScrollController();
  int offset = 0;
  List<TaskEntity> tasksResult = [];
  List<TaskEntity> existingTask = [];
  List<TaskEntity> currentTask = [];
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    context.read<TodoBloc>().add(const TodoQuery());
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        switch (state.status) {
          case TodoStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case TodoStatus.success:
            if (state.todos.isEmpty) {
              return const Center(
                child: Text("No Task"),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.todos.length
                  : state.todos.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.todos.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                {
                  bool isSameDate = true;
                  final DateTime date = state.todos[index].createdAt;
                  final item = state.todos[index];
                  if (index == 0) {
                    isSameDate = false;
                  } else {
                    final DateTime prevDate = state.todos[index - 1].createdAt;
                    isSameDate = date.isSameDate(prevDate);
                  }
                  if (index == 0 || !(isSameDate)) {
                    return Column(children: [
                      Text(date.formatDate()),
                      Dismissible(
                        key: Key(state.todos[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                            state.todos.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(state.todos[index].title),
                          subtitle: Text(state.todos[index].description),
                        ),
                      )
                    ]);
                  } else {
                    return Dismissible(
                      key: Key(state.todos[index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          state.todos.removeAt(index);
                        });
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        title: Text(state.todos[index].title),
                        subtitle: Text(state.todos[index].description),
                      ),
                    );
                  }
                }
              },
            );
          case TodoStatus.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<TodoBloc>().add(const TodoQuery());
      print("scroll");
    }
  }
}
