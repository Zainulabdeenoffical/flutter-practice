import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _autoSync = true;
  bool _notifications = true;
  String _language = 'English';
  String _storageLocation = 'Internal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          // Account Section
          _buildSectionHeader('Account'),
          _buildNavigationItem(
            icon: Icons.person,
            title: 'Profile',
            subtitle: 'Manage your account information',
            onTap: () {
              // Navigate to profile screen
            },
          ),
          _buildNavigationItem(
            icon: Icons.lock,
            title: 'Security',
            subtitle: 'Change password and security settings',
            onTap: () {
              // Navigate to security screen
            },
          ),
          
          const Divider(),
          
          // Appearance Section
          _buildSectionHeader('Appearance'),
          _buildSwitchItem(
            icon: _darkMode ? Icons.dark_mode : Icons.light_mode,
            title: 'Dark Mode',
            subtitle: 'Toggle dark mode on or off',
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
          ),
          _buildDropdownItem(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Select your preferred language',
            value: _language,
            items: const ['English', 'Spanish', 'French', 'German', 'Chinese'],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _language = value;
                });
              }
            },
          ),
          
          const Divider(),
          
          // Storage Section
          _buildSectionHeader('Storage'),
          _buildDropdownItem(
            icon: Icons.storage,
            title: 'Storage Location',
            subtitle: 'Choose where to store your documents',
            value: _storageLocation,
            items: const ['Internal', 'SD Card'],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _storageLocation = value;
                });
              }
            },
          ),
          _buildSwitchItem(
            icon: Icons.cloud_upload,
            title: 'Auto Sync',
            subtitle: 'Automatically sync documents to cloud',
            value: _autoSync,
            onChanged: (value) {
              setState(() {
                _autoSync = value;
              });
            },
          ),
          
          const Divider(),
          
          // Notifications Section
          _buildSectionHeader('Notifications'),
          _buildSwitchItem(
            icon: Icons.notifications,
            title: 'Push Notifications',
            subtitle: 'Receive alerts and updates',
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          
          const Divider(),
          
          // About Section
          _buildSectionHeader('About'),
          ListTile(
            title: const Text('Version'),
            subtitle: const Text('2.1.0'),
          ),
          _buildNavigationItem(
            title: 'Terms of Service',
            onTap: () {
              // Navigate to terms of service
            },
          ),
          _buildNavigationItem(
            title: 'Privacy Policy',
            onTap: () {
              // Navigate to privacy policy
            },
          ),
          
          const SizedBox(height: 24),
          
          // Sign Out Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle sign out
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildNavigationItem({
    IconData? icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Theme.of(context).colorScheme.primary) : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    IconData? icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Theme.of(context).colorScheme.primary) : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildDropdownItem<T>({
    IconData? icon,
    required String title,
    String? subtitle,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Theme.of(context).colorScheme.primary) : null,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: DropdownButton<T>(
        value: value,
        onChanged: onChanged,
        underline: const SizedBox(),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
      ),
    );
  }
}
