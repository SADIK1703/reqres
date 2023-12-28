import 'package:flutter/material.dart';

class CustomCircleLoading extends StatelessWidget {
  const CustomCircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      width: 48,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
