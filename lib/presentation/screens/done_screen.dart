import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robinhood/domain/entities/task_entity.dart';
import 'package:robinhood/presentation/bloc/done_bloc/done_bloc.dart';
import 'package:robinhood/utils/extension.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  final _scrollController = ScrollController();
  int offset = 0;
  List<TaskEntity> tasksResult = [];
  List<TaskEntity> existingTask = [];
  List<TaskEntity> currentTask = [];
  bool isLoaded = false;

  @override
  void initState() {
    // Done: implement initState
    context.read<DoneBloc>().add(const DoneQuery());
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoneBloc, DoneState>(
      builder: (context, state) {
        switch (state.status) {
          case DoneStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case DoneStatus.success:
            if (state.dones.isEmpty) {
              return const Center(
                child: Text("No Task"),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.dones.length
                  : state.dones.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.dones.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                {
                  bool isSameDate = true;
                  final DateTime date = state.dones[index].createdAt;
                  final item = state.dones[index];
                  if (index == 0) {
                    isSameDate = false;
                  } else {
                    final DateTime prevDate = state.dones[index - 1].createdAt;
                    isSameDate = date.isSameDate(prevDate);
                  }
                  if (index == 0 || !(isSameDate)) {
                    return Column(children: [
                      Text(date.formatDate()),
                      Dismissible(
                        key: Key(state.dones[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                            state.dones.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          title: Text(state.dones[index].title),
                          subtitle: Text(state.dones[index].description),
                        ),
                      )
                    ]);
                  } else {
                    return Dismissible(
                      key: Key(state.dones[index].id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          state.dones.removeAt(index);
                        });
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        title: Text(state.dones[index].title),
                        subtitle: Text(state.dones[index].description),
                      ),
                    );
                  }
                }
              },
            );
          case DoneStatus.error:
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
      context.read<DoneBloc>().add(const DoneQuery());
      print("scroll");
    }
  }
}
