import 'dart:async';
import 'package:flutter/foundation.dart';

class CountdownTimerController {
  CountdownTimerController({
    required this.initialSeconds,
    required this.onTick,
    required this.onFinished,
  });

  final int initialSeconds;
  final void Function(int remainingSeconds) onTick;
  final VoidCallback onFinished;

  Timer? _timer;
  int _remainingSeconds = 0;

  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _timer?.isActive ?? false;

  void start() {
    _timer?.cancel();
    _remainingSeconds = initialSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingSeconds--;
      onTick(_remainingSeconds);
      if (_remainingSeconds == 0) {
        timer.cancel();
        onFinished();
      }
    });
  }

  void cancel() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}
