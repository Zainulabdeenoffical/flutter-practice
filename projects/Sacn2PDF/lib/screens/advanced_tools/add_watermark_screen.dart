import 'package:flutter/material.dart';

class AddWatermarkScreen extends StatelessWidget {
  const AddWatermarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Watermark')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter Watermark Text:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter watermark text here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Add action to add watermark
              },
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Apply Watermark'),
            ),
          ],
        ),
      ),
    );
  }
}
