import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ContactCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(user.photoUrl),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.lastMessage,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              user.time,
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
