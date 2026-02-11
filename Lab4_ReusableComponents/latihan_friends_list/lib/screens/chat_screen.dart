import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;

  const ChatScreen({
    super.key,
    required this.user,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController messageController =
      TextEditingController();

  final List<MessageModel> chatMessages = [
    const MessageModel(text: "Hai!", isMe: false),
    const MessageModel(text: "Halo juga!", isMe: true),
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      chatMessages.add(
        MessageModel(
          text: messageController.text,
          isMe: true,
        ),
      );
    });

    messageController.clear();
  }

  // 📷 Fake Photo Send
  void sendPhoto() {
    setState(() {
      chatMessages.add(
        const MessageModel(
          text: "📷 Photo sent",
          isMe: true,
        ),
      );
    });
  }

  // 🎤 Fake Voice Note Send
  void sendVoiceNote() {
    setState(() {
      chatMessages.add(
        const MessageModel(
          text: "🎤 Voice note sent",
          isMe: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage:
                  NetworkImage(widget.user.photoUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(widget.user.name),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.videocam),
          SizedBox(width: 16),
          Icon(Icons.call),
          SizedBox(width: 16),
        ],
      ),

      body: Container(
        color: const Color(0xFFE3F2FD),
        child: Column(
          children: [

            // 🔹 CHAT LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: chatMessages[index],
                  );
                },
              ),
            ),

            // 🔹 INPUT AREA
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 6),
              color: Colors.white,
              child: Row(
                children: [

                  // 📷 CAMERA
                  IconButton(
                    icon: const Icon(Icons.camera_alt,
                        color: Colors.grey),
                    onPressed: sendPhoto,
                  ),

                  // 💬 TEXT FIELD
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Type message...",
                        filled: true,
                        fillColor:
                            const Color(0xFFF5F7FA),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(
                                horizontal: 16),
                      ),
                    ),
                  ),

                  // 🎤 MIC
                  IconButton(
                    icon: const Icon(Icons.mic,
                        color: Colors.grey),
                    onPressed: sendVoiceNote,
                  ),

                  // 📤 SEND BUTTON
                  CircleAvatar(
                    backgroundColor:
                        const Color(0xFF1976D2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
