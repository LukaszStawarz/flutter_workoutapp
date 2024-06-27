import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
        child: Text(
          'History screen',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
