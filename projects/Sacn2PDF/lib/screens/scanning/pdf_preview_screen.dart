import 'package:flutter/material.dart';

class mPDFPreviewScreen extends StatelessWidget {
  const mPDFPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Preview"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PDF Preview',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.black12,
              width: 300,
              height: 500,
              child: const Center(child: Text("PDF Content Preview")),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle PDF actions here
              },
              child: const Text('Proceed with PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
