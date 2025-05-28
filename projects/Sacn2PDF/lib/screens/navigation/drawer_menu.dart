import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Menu'),
      ),
      drawer: Drawer(
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
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('All Documents'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/pdfs-list');
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
                Navigator.pushNamed(context, '/cloud-sync-prompt');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile-settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Feedback'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help-center');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                // Handle sign out
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Drawer Menu Example',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Text('Open Drawer'),
            ),
          ],
        ),
      ),
    );
  }
}
