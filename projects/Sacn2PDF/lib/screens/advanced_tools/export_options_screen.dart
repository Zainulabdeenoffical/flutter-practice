import 'package:flutter/material.dart';

class ExportOptionsScreen extends StatelessWidget {
  const ExportOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Options')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text('Export as PDF'),
            onTap: () {
              // Action for Exporting as PDF
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Export as Image'),
            onTap: () {
              // Action for Exporting as Image
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.file_copy),
            title: const Text('Export as Text'),
            onTap: () {
              // Action for Exporting as Text
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud_download),
            title: const Text('Export to Cloud'),
            onTap: () {
              // Action for Exporting to Cloud
            },
          ),
        ],
      ),
    );
  }
}
