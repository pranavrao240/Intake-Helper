import 'package:flutter/material.dart';
import 'package:intake_helper/page/notification_service.dart';

class Samplepage extends StatelessWidget {
  const Samplepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Reminder Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await NotificationService.notifyAtTime(
              id: 2,
              title: "🍽️ Meal Reminder",
              body: "It's time to eat at 19:20!",
              hour: 20,
              minute: 55,
            );
          },
          child: const Text("Notify me at 19:20"),
        ),
      ),
    );
  }
}
