import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/user_model.dart';
import '../widgets/contact_card.dart';
import 'chat_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<UserModel> filteredUsers = users;
  final TextEditingController searchController =
      TextEditingController();

  void searchContacts(String query) {
    final results = users.where((user) {
      final nameLower = user.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Column(
        children: [

          // 🔎 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              onChanged: searchContacts,
              decoration: InputDecoration(
                hintText: "Search contact...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 🔹 CONTACT LIST
          Expanded(
            child: ListView.separated(
              itemCount: filteredUsers.length,
              separatorBuilder: (_, __) =>
                  const Divider(indent: 80, height: 1),
              itemBuilder: (context, index) {
                final user = filteredUsers[index];

                return ContactCard(
                  user: user,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ChatScreen(user: user),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
