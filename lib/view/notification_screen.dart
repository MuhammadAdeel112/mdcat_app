import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Later we will fetch notifications from provider / API
    final notifications = [
      "🎉 Your signup bonus coins have been credited.",
      "📢 New mock test available for Biology.",
      "✅ Your last quiz score report is ready.",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.deepPurple),
            title: Text(notifications[index]),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
