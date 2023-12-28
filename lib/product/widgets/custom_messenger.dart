import 'package:flutter/material.dart';

enum CustomMessengerState {
  success,
  info,
  warning,
  error,
}

extension CustomMessengerHelper on CustomMessengerState {
  Color getColor() {
    switch (this) {
      case CustomMessengerState.success:
        return Colors.green;
      case CustomMessengerState.info:
        return Colors.blue;
      case CustomMessengerState.warning:
        return Colors.yellow;
      case CustomMessengerState.error:
        return Colors.red;
    }
  }

  void showCustomMessenger(
    final BuildContext context,
    final String content, {
    final Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 2),
        margin: const EdgeInsets.only(bottom: 64),
        backgroundColor: Colors.transparent,
        content: DecoratedBox(
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
}
