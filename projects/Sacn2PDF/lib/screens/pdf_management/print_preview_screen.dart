import 'package:flutter/material.dart';

class PrintPreviewScreen extends StatelessWidget {
  const PrintPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Print Preview')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(
                  child: Text(
                    'PDF Preview',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Trigger print logic
              },
              icon: const Icon(Icons.print),
              label: const Text('Print PDF'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
