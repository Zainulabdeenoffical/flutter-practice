import 'package:flutter/material.dart';
import 'submit_feedback_screen.dart';
import 'faq_screen.dart';
import 'contact_us_screen.dart';
import 'about_app_screen.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('FAQ'),
              onTap: () {
                // Navigate to FAQ screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FaqScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Submit Feedback'),
              onTap: () {
                // Navigate to Submit Feedback screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubmitFeedbackScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact Us'),
              onTap: () {
                // Navigate to Contact Us screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About the App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutAppScreen()),
                );
                // Navigate to About the App screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
