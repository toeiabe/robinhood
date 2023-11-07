import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/presentation/bloc/doing_bloc/doing_bloc.dart';
import 'package:robinhood/utils/extension.dart';

class DoingScreen extends StatefulWidget {
  const DoingScreen({super.key});

  @override
  State<DoingScreen> createState() => _DoingScreenState();
}

class _DoingScreenState extends State<DoingScreen> {
  final _scrollController = ScrollController();
  int offset = 0;
  List<TaskEntity> tasksResult = [];
  List<TaskEntity> existingTask = [];
  List<TaskEntity> currentTask = [];
  bool isLoaded = false;

  @override
  void initState() {
    // Doing: implement initState
    context.read<DoingBloc>().add(const DoingQuery());
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoingBloc, DoingState>(
      builder: (context, state) {
        switch (state.status) {
          case DoingStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case DoingStatus.success:
            if (state.doings.isEmpty) {
              return const Center(
                child: Text("No Task"),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.doings.length
                  : state.doings.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.doings.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                {
                  bool isSameDate = true;
                  final DateTime date = state.doings[index].createdAt;
                  final item = state.doings[index];
                  if (index == 0) {
                    isSameDate = false;
                  } else {
                    final DateTime prevDate = state.doings[index - 1].createdAt;
                    isSameDate = date.isSameDate(prevDate);
                  }
                  if (index == 0 || !(isSameDate)) {
                    return Column(children: [
                      Text(date.formatDate()),
                      Dismissible(
                        key: Key(state.doings[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                            state.doings.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(state.doings[index].title),
                          subtitle: Text(state.doings[index].description),
                        ),
                      )
                    ]);
                  } else {
                    return Dismissible(
                      key: Key(state.doings[index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          state.doings.removeAt(index);
                        });
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        title: Text(state.doings[index].title),
                        subtitle: Text(state.doings[index].description),
                      ),
                    );
                  }
                }
              },
            );
          case DoingStatus.error:
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
      context.read<DoingBloc>().add(const DoingQuery());
      print("scroll");
    }
  }
}
