import 'package:flutter/material.dart';

class ShareModalScreen extends StatelessWidget {
  const ShareModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Share PDF')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.share, size: 60, color: Colors.blueAccent),
            const SizedBox(height: 20),
            const Text(
              'Choose a method to share your PDF',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.email),
                  label: const Text('Email'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text('Message'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                  label: const Text('Copy Link'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
