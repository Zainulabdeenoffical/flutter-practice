import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Document Scanned',
      'message': 'Invoice_April2025.pdf has been successfully scanned and saved.',
      'time': '10:30 AM',
      'date': 'Today',
      'read': false,
      'icon': Icons.document_scanner,
    },
    {
      'title': 'Cloud Sync Complete',
      'message': 'All your documents have been synced to the cloud.',
      'time': '9:15 AM',
      'date': 'Today',
      'read': false,
      'icon': Icons.cloud_done,
    },
    {
      'title': 'OCR Processing Complete',
      'message': 'Text extraction completed for Contract_2025.pdf.',
      'time': '4:45 PM',
      'date': 'Yesterday',
      'read': true,
      'icon': Icons.text_fields,
    },
    {
      'title': 'Storage Warning',
      'message': 'You\'ve used 80% of your storage. Consider upgrading your plan.',
      'time': '11:20 AM',
      'date': 'Yesterday',
      'read': true,
      'icon': Icons.storage,
    },
    {
      'title': 'New Feature Available',
      'message': 'Try our new signature capture feature for your documents!',
      'time': '3:30 PM',
      'date': 'Apr 18, 2025',
      'read': true,
      'icon': Icons.new_releases,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {
              // Mark all as read
            },
            child: const Text('Mark all as read'),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return _buildNotificationItem(notification);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No Notifications',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'You don\'t have any notifications yet.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: notification['read']
                ? Colors.grey.shade200
                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            notification['icon'],
            color: notification['read']
                ? Colors.grey.shade600
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          notification['title'],
          style: TextStyle(
            fontWeight: notification['read'] ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification['message']),
            const SizedBox(height: 4),
            Text(
              '${notification['date']} at ${notification['time']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        isThreeLine: true,
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            // Handle menu item selection
            if (value == 'mark_read') {
              setState(() {
                notification['read'] = true;
              });
            } else if (value == 'delete') {
              setState(() {
                _notifications.remove(notification);
              });
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: notification['read'] ? 'mark_unread' : 'mark_read',
              child: Text(notification['read'] ? 'Mark as unread' : 'Mark as read'),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
        ),
        onTap: () {
          // Mark as read when tapped
          if (!notification['read']) {
            setState(() {
              notification['read'] = true;
            });
          }
          // Navigate to related screen
        },
      ),
    );
  }
}
