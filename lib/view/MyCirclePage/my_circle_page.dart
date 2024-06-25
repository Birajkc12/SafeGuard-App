import 'package:flutter/material.dart';

class MyCirclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Circle'),
      ),
      body: const Center(
        child: Text(
          'My Circle Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
