import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frequently Asked Questions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('How do I use the app?'),
              subtitle: const Text('You can start by uploading your PDF files and using the various tools available.'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Can I sync my data?'),
              subtitle: const Text('Yes, you can sync your data across devices by using the cloud sync option in settings.'),
            ),
            const Divider(),
            ListTile(
              title: const Text('How do I contact support?'),
              subtitle: const Text('You can contact support by visiting the "Contact Us" section in the Help Center.'),
            ),
            // Add more FAQs here...
          ],
        ),
      ),
    );
  }
}
