import 'package:flutter/material.dart';

class EmailPdfFormScreen extends StatelessWidget {
  const EmailPdfFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email PDF')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter Recipient Email Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Recipient Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add action for sending email
              },
              icon: const Icon(Icons.send),
              label: const Text('Send PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
