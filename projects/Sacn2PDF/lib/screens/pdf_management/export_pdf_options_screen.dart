import 'package:flutter/material.dart';

class ExportPdfOptionsScreen extends StatelessWidget {
  const ExportPdfOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Options')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Export via Email'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud_upload),
            title: const Text('Upload to Cloud'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share PDF'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
