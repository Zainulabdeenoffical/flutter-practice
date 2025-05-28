import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'We are here to help you!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'If you have any issues, suggestions, or inquiries, please contact us using the following methods:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email Us'),
              onTap: () {
                // Action to open email client or show email info
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Call Us'),
              onTap: () {
                // Action to initiate phone call
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Visit Us'),
              onTap: () {
                // Action to show address or map
              },
            ),
          ],
        ),
      ),
    );
  }
}
