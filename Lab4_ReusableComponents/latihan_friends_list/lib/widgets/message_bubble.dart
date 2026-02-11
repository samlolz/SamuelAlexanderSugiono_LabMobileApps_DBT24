import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final isVoice = message.text.contains("Voice note sent");

    return Align(
      alignment:
          isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: isMe
              ? const Color(0xFF1976D2)
              : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft:
                Radius.circular(isMe ? 18 : 0),
            bottomRight:
                Radius.circular(isMe ? 0 : 18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        // 🔥 Kalau Voice Note tampil beda
        child: isVoice
            ? Row(
                children: [
                  const Icon(Icons.play_arrow,
                      color: Colors.white),
                  const SizedBox(width: 8),

                  // 🔊 Fake waveform bars
                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        18,
                        (index) => Container(
                          width: 3,
                          height: (index % 5 + 4) * 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),
                  const Text(
                    "0:07",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12),
                  ),
                ],
              )

            // 🔹 Kalau bukan voice note
            : Text(
                message.text,
                style: TextStyle(
                  color:
                      isMe ? Colors.white : Colors.black,
                ),
              ),
      ),
    );
  }
}
