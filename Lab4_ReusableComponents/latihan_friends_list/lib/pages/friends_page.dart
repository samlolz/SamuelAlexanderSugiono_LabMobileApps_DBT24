import 'package:flutter/material.dart';
import '../widgets/friend_card.dart';
import 'chat_page.dart';

class FriendsPage extends StatelessWidget {
  FriendsPage({super.key});

  final List<Map<String, String>> friends = [
    {"name": "Samuel", "message": "Bro tugas udah?", "time": "08:00"},
    {"name": "Kevin", "message": "Nanti ketemu ya", "time": "09:30"},
    {"name": "Raisa", "message": "Oke siap", "time": "Yesterday"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends List"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return FriendCard(
            name: friend["name"]!,
            lastMessage: friend["message"]!,
            time: friend["time"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatPage(name: friend["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
