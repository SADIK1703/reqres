import 'package:flutter/material.dart';

void main() async {
  runApp(const ReqresApp());
}

class ReqresApp extends StatelessWidget {
  const ReqresApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      builder: (final context, final widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'ReqresApp',
    );
  }
}
