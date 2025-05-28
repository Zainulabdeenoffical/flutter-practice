// import 'package:flutter/material.dart';
//
// class DeletePdfScreen extends StatelessWidget {
//   const DeletePdfScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Delete PDF'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.warning, color: Colors.red, size: 60),
//             const SizedBox(height: 20),
//             const Text(
//               'Are you sure you want to delete this PDF?',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                   onPressed: () {
//                     // Perform delete action here
//                     Navigator.pop(context); // Or show a snackbar/dialog
//                   },
//                   icon: const Icon(Icons.delete),
//                   label: const Text('Delete'),
//                 ),
//                 const SizedBox(width: 20),
//                 OutlinedButton.icon(
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.cancel),
//                   label: const Text('Cancel'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folder Delete Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DeletePdfScreen(),
    );
  }
}

class DeletePdfScreen extends StatefulWidget {
  const DeletePdfScreen({super.key});

  @override
  State<DeletePdfScreen> createState() => _FolderDeleteHomeState();
}

class _FolderDeleteHomeState extends State<DeletePdfScreen> {
  final TextEditingController _folderController = TextEditingController();
  String _message = '';

  @override
  void dispose() {
    _folderController.dispose();
    super.dispose();
  }

  Future<void> _openDeleteScreen(String path) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DeleteFolderScreen(folderPath: path),
      ),
    );

    if (result == true) {
      setState(() {
        _message = 'Folder deleted successfully.';
      });
    } else {
      setState(() {
        _message = 'Delete cancelled or failed.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Folder Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _folderController,
              decoration: const InputDecoration(
                labelText: 'Enter folder path',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final path = _folderController.text.trim();
                if (path.isNotEmpty) {
                  _openDeleteScreen(path);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a folder path')),
                  );
                }
              },
              child: const Text('Delete Folder'),
            ),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class DeleteFolderScreen extends StatelessWidget {
  final String folderPath;

  const DeleteFolderScreen({super.key, required this.folderPath});

  Future<void> _deleteFolder(BuildContext context) async {
    try {
      final folder = Directory(folderPath);

      if (await folder.exists()) {
        await folder.delete(recursive: true);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder deleted successfully')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder does not exist')),
        );
        Navigator.pop(context, false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete folder: $e')),
      );
      Navigator.pop(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Delete Folder')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 60),
              const SizedBox(height: 20),
              Text(
                'Are you sure you want to delete this folder?\n$folderPath',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () => _deleteFolder(context),
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context, false),
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

