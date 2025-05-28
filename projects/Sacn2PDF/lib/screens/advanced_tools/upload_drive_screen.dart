import 'package:flutter/material.dart';

class UploadDriveScreen extends StatelessWidget {
  const UploadDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload to Drive')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select a file to upload to your drive:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add action for selecting file to upload
              },
              icon: const Icon(Icons.upload_file),
              label: const Text('Choose File'),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Add action for uploading to drive
              },
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Upload to Drive'),
            ),
          ],
        ),
      ),
    );
  }
}
