import 'package:flutter/material.dart';

class CloudSyncPromptScreen extends StatelessWidget {
  const CloudSyncPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cloud Sync')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Would you like to sync your data with the cloud?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Syncing allows you to store and access your files across devices.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for syncing data
                  },
                  child: const Text('Sync Now'),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    // Action for dismissing prompt
                  },
                  child: const Text('Not Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
