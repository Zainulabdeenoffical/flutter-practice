import 'package:flutter/material.dart';

class PdfsListScreen extends StatelessWidget {
  const PdfsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with actual list of PDFs
    return Scaffold(
      appBar: AppBar(
        title: Text('My PDFs'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text('Document ${index + 1}'),
            subtitle: Text('Date saved'),
            onTap: () {
              // Navigate to view single PDF screen
            },
          );
        },
      ),
    );
  }
}
