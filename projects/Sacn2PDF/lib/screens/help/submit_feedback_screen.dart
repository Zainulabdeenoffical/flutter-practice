import 'package:flutter/material.dart';

class SubmitFeedbackScreen extends StatelessWidget {
  const SubmitFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'We value your feedback. Please let us know your thoughts or issues:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
                hintText: 'Enter your feedback here...',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Action to submit feedback
              },
              icon: const Icon(Icons.send),
              label: const Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
