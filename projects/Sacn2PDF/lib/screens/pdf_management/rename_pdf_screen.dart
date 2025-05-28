import 'package:flutter/material.dart';

class RenamePdfScreen extends StatelessWidget {
  const RenamePdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _renameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Rename PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _renameController,
              decoration: InputDecoration(
                labelText: 'New Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle renaming
              },
              child: Text('Rename'),
            ),
          ],
        ),
      ),
    );
  }
}
