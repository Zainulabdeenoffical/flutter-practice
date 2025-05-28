import 'package:flutter/material.dart';

class AppThemeToggleScreen extends StatelessWidget {
  const AppThemeToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Theme Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Choose Your Preferred App Theme:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action for light theme
                  },
                  child: const Text('Light Theme'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Action for dark theme
                  },
                  child: const Text('Dark Theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
