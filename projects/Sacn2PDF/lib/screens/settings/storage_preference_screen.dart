import 'package:flutter/material.dart';

class StoragePreferenceScreen extends StatelessWidget {
  const StoragePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Choose Your Storage Preference:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.sd_storage),
              title: const Text('Internal Storage'),
              onTap: () {
                // Action for internal storage preference
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text('Cloud Storage'),
              onTap: () {
                // Action for cloud storage preference
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.sd_storage),
              title: const Text('External Storage'),
              onTap: () {
                // Action for external storage preference
              },
            ),
          ],
        ),
      ),
    );
  }
}
