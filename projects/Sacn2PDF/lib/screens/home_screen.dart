import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _recentScans = [
    {
      'title': 'Invoice_April2025.pdf',
      'date': 'Today, 10:30 AM',
      'pages': 3,
      'icon': Icons.receipt,
    },
    {
      'title': 'Contract_2025.pdf',
      'date': 'Yesterday, 4:15 PM',
      'pages': 12,
      'icon': Icons.description,
    },
    {
      'title': 'ID_Card.pdf',
      'date': 'Apr 18, 2025',
      'pages': 1,
      'icon': Icons.credit_card,
    },
    {
      'title': 'Receipt_Grocery.pdf',
      'date': 'Apr 15, 2025',
      'pages': 1,
      'icon': Icons.receipt_long,
    },
  ];

  final List<Map<String, dynamic>> _folders = [
    {
      'name': 'Invoices',
      'count': 12,
      'icon': Icons.receipt,
      'color': Colors.blue,
    },
    {
      'name': 'Receipts',
      'count': 28,
      'icon': Icons.receipt_long,
      'color': Colors.green,
    },
    {
      'name': 'ID Documents',
      'count': 5,
      'icon': Icons.credit_card,
      'color': Colors.orange,
    },
    {
      'name': 'Contracts',
      'count': 7,
      'icon': Icons.description,
      'color': Colors.purple,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan2PDF Pro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Text(
                  'Welcome back, Alex!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'What would you like to scan today?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 24),

                // Quick Actions
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickActionCard(
                      icon: Icons.document_scanner,
                      label: 'Scan Document',
                      onTap: () => Navigator.pushNamed(context, '/camera'),
                    ),
                    _buildQuickActionCard(
                      icon: Icons.photo_library,
                      label: 'Import Image',
                      onTap: () {
                        // Handle import image action
                      },
                    ),
                    _buildQuickActionCard(
                      icon: Icons.create_new_folder,
                      label: 'New Folder',
                      onTap: () {
                        // Handle new folder action
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Recent Scans
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Scans',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all documents
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _recentScans.length,
                  itemBuilder: (context, index) {
                    final scan = _recentScans[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            scan['icon'],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        title: Text(scan['title']),
                        subtitle: Text(scan['date']),
                        trailing: Text('${scan['pages']} page${scan['pages'] > 1 ? 's' : ''}'),
                        onTap: () => Navigator.pushNamed(context, '/pdf_preview'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),

                // Folders
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Folders',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all folders
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: _folders.length,
                  itemBuilder: (context, index) {
                    final folder = _folders[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          // Navigate to folder contents
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                folder['icon'],
                                color: folder['color'],
                                size: 32,
                              ),
                              const Spacer(),
                              Text(
                                folder['name'],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${folder['count']} item${folder['count'] > 1 ? 's' : ''}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/camera'),
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    'Z',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'M Zain Ul Abideen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'zu4425@gmail.com',
                  style: TextStyle(
                   // color: Colors.white.withOpacity(0.3),  // Sets the text color to white with 30% opacity
                    fontSize: 14,                          // Sets the font size to 14
                  ),

                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('All Documents'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to all documents
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to favorites
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud_upload),
            title: const Text('Cloud Sync'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to cloud sync
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}

