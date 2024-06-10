import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'Coming Soon',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }
}
