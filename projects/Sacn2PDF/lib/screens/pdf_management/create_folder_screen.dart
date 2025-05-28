// import 'package:flutter/material.dart';
//
// class CreateFolderScreen extends StatelessWidget {
//   const CreateFolderScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _folderNameController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Folder'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _folderNameController,
//               decoration: InputDecoration(
//                 labelText: 'Folder Name',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle folder creation
//               },
//               child: Text('Create'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CreateFolderScreen extends StatefulWidget {
  const CreateFolderScreen({Key? key}) : super(key: key);

  @override
  _CreateFolderScreenState createState() => _CreateFolderScreenState();
}

class _CreateFolderScreenState extends State<CreateFolderScreen> {
  final TextEditingController _folderNameController = TextEditingController();

  Future<void> _createFolder(String folderName) async {
    try {
      if (folderName.trim().isEmpty) {
        _showSnackBar('Folder name cannot be empty');
        return;
      }

      // Get app documents directory (app-specific storage)
      final Directory appDocDir = await getApplicationDocumentsDirectory();

      // Compose new folder path
      final newFolder = Directory('${appDocDir.path}/$folderName');

      if (await newFolder.exists()) {
        _showSnackBar('Folder already exists');
      } else {
        await newFolder.create(recursive: true);
        _showSnackBar('Folder created at ${newFolder.path}');
      }
    } catch (e) {
      _showSnackBar('Error creating folder: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _folderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Folder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _folderNameController,
              decoration: InputDecoration(
                labelText: 'Folder Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _createFolder(_folderNameController.text),
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}

