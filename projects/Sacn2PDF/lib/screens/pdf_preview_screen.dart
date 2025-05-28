// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class scanPDFPreviewScreen extends StatefulWidget {
  const scanPDFPreviewScreen({super.key});

  @override
  PDFPreviewScreenState createState() => PDFPreviewScreenState();
}

class PDFPreviewScreenState extends State<scanPDFPreviewScreen> {
  int _currentPage = 0;
  final int _totalPages = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice_April2025.pdf'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Handle share action
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              switch (value) {
                case 'download':
                  // Handle download
                  break;
                case 'print':
                  // Handle print
                  break;
                case 'email':
                  // Handle email
                  break;
                case 'rename':
                  // Handle rename
                  break;
                case 'delete':
                  // Handle delete
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'download',
                child: Row(
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text('Download'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'print',
                child: Row(
                  children: [
                    Icon(Icons.print),
                    SizedBox(width: 8),
                    Text('Print'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'email',
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text('Email'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'rename',
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 8),
                    Text('Rename'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // PDF Viewer
          Expanded(
            child: Center(
              child: _buildPDFPreview(),
            ),
          ),

          // Page Navigation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _currentPage > 0
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                ),
                Text(
                  'Page ${_currentPage + 1} of $_totalPages',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _currentPage < _totalPages - 1
                      ? () {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),

          // Thumbnails
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _totalPages + 1, // +1 for the "Add page" button
              itemBuilder: (context, index) {
                if (index == _totalPages) {
                  // Add page button
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        // Handle add page
                      },
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).dividerColor,
                          width: _currentPage == index ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: _currentPage == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(Icons.download, 'Save'),
            _buildActionButton(Icons.share, 'Share'),
            _buildActionButton(Icons.edit, 'Edit'),
            _buildActionButton(Icons.print, 'Print'),
          ],
        ),
      ),
    );
  }

  Widget _buildPDFPreview() {
    // In a real app, this would be a PDF viewer
    // Using a placeholder for this example
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 200,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            // Content
            const SizedBox(height: 24),
            ...List.generate(
              5,
              (index) => Container(
                width: double.infinity,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            // Table
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            // Footer
            const SizedBox(height: 24),
            ...List.generate(
              3,
              (index) => Container(
                width: double.infinity,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Handle action
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
