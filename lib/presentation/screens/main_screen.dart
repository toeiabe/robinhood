import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:robinhood/presentation/screens/doing_screen.dart';
import 'package:robinhood/presentation/screens/done_screen.dart';
import 'package:robinhood/presentation/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  late Timer _timer;
  int _start = 10;
  bool isLock = true;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            isLock = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    startTimer();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {}

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {}

    /* if (isBackground) {
      // service.stop();
    } else {
      // service.start();
    }*/
  }

  void _handleUserInteraction() {
    setState(() {
      _start = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLock) {
      return GestureDetector(
        onTap: () => _handleUserInteraction(),
        onScaleUpdate: (details) => _handleUserInteraction(),
        onLongPress: () => _handleUserInteraction,
        onDoubleTap: () => _handleUserInteraction(),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "to-do",
                  ),
                  Tab(
                    text: "doing",
                  ),
                  Tab(
                    text: "done",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
                children: [TodoScreen(), DoingScreen(), DoneScreen()]),
          ),
        ),
      );
    } else {
      return ScreenLock(
          correctString: "123456",
          onUnlocked: () {
            setState(() {
              isLock = false;
            });
            _handleUserInteraction();
          });
    }
  }
}
