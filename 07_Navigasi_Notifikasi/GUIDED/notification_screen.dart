import 'package:flutter/material.dart';
import 'package:pertemuan72/local_notifications.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications")),
      body: Center(
        child: ElevatedButton(
          onPressed:
              NotificationService.showNotification, // Panggil fungsi notifikasi
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
