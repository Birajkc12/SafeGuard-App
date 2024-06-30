// sos_page.dart
import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Page'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'This is the SOS page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
