import 'package:flutter/material.dart';

class MoveToFolderScreen extends StatelessWidget {
  const MoveToFolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with actual list of folders
    return Scaffold(
      appBar: AppBar(
        title: Text('Move to Folder'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with actual count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.folder),
            title: Text('Folder ${index + 1}'),
            onTap: () {
              // Handle moving file to selected folder
            },
          );
        },
      ),
    );
  }
}
