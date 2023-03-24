import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StreamApp extends StatefulWidget {
  const StreamApp({Key? key}) : super(key: key);

  @override
  State<StreamApp> createState() => _StreamAppState();
}

class _StreamAppState extends State<StreamApp> {
  final StreamController<int> _controller = StreamController.broadcast();
  int? _controllerValue;
  double? _streamValue;
  StreamSubscription<int>? _subscription;
  StreamSubscription<double>? _subscription2;

  Future<void> _streamSubscription() async {
    if (_subscription2 == null) {
      _subscription2 = _getDelayedRandomValue().listen((event) {
        setState(() {
          _streamValue = event;
        });
      });
    } else {
      await _subscription2?.cancel();
      _subscription2 = null;
    }

    if (_controller.hasListener) {
      await _subscription?.cancel();
    } else {
      _subscription = _controller.stream.listen(_setControllerValue);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stream App",
      theme: ThemeData(primarySwatch: Colors.lime),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Value from Controller: $_controllerValue"),
              const SizedBox(height: 20),
              Text("Value from Stream: $_streamValue"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: _subscription2 != null && _controller.hasListener
                        ? Colors.red.shade400
                        : Colors.yellow,
                    onPressed: () async {
                      await _streamSubscription();
                    },
                    child: Text(
                      _controller.hasListener ? "Unsubscribe!" : "Subscribe",
                    ),
                  ),
                  const SizedBox(width: 16),
                  MaterialButton(
                    color: Colors.blue.shade400,
                    onPressed: () {
                      _controller.add(Random().nextInt(100));
                    },
                    child: const Text("Add Value"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setControllerValue(int value) {
    if (kDebugMode) {
      print("Controller Value: $value");
    }
    setState(() {
      _controllerValue = value;
    });
  }

  Stream<double> _getDelayedRandomValue() async* {
    final random = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
}
