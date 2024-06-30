import 'package:flutter/material.dart';

class MedicalEmergencyPage extends StatelessWidget {
  const MedicalEmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController detailsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Emergency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please provide details of the medical emergency:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: detailsController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Details',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your emergency alert sending logic here
                final details = detailsController.text;
                // Send the details to the admin or emergency service
              },
              child: const Text('Send Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
