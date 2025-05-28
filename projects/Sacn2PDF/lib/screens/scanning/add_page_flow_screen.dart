import 'package:flutter/material.dart';

class AddPageFlowScreen extends StatefulWidget {
  const AddPageFlowScreen({Key? key}) : super(key: key);

  @override
  _AddPageFlowScreenState createState() => _AddPageFlowScreenState();
}

class _AddPageFlowScreenState extends State<AddPageFlowScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'id': '1',
      'name': 'Page 1',
      'thumbnail': 'assets/images/page1.png',
    },
    {
      'id': '2',
      'name': 'Page 2',
      'thumbnail': 'assets/images/page2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pages'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              // Finish and go to PDF preview
              Navigator.pushNamed(context, '/page-reorder');
            },
            icon: const Icon(Icons.check),
            label: const Text('Done'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Instructions
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Add more pages to your document. You can scan new pages or import from gallery.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Current Pages
          Expanded(
            child: _pages.isEmpty
                ? _buildEmptyState()
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return _buildPageCard(page, index);
              },
            ),
          ),

          // Add Page Options
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to camera screen
                    Navigator.pushNamed(context, '/camera');
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Scan New Page'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    // Import from gallery
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Import from Gallery'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.description_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No Pages Added Yet',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Start by scanning a new page or importing from gallery.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageCard(Map<String, dynamic> page, int index) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Page Thumbnail
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Thumbnail
                Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Icon(
                      Icons.description,
                      size: 60,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),

                // Page Number Badge
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Page ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Delete Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pages.removeAt(index);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Page Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Preview page
                    Navigator.pushNamed(context, '/page-preview', arguments: page);
                  },
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text('Preview'),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    // Edit page
                    Navigator.pushNamed(context, '/edit-page', arguments: page);
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

