import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String username;
  final String userImage;
  final bool isOnline;

  const ChatDetailPage({
    super.key,
    required this.username,
    required this.userImage,
    required this.isOnline,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  
  // Konten chat yang berbeda-beda untuk setiap user
  late final List<Map<String, dynamic>> messages;

  @override
  void initState() {
    super.initState();
    messages = _getMessagesForUser(widget.username);
  }

  List<Map<String, dynamic>> _getMessagesForUser(String username) {
    // Konten chat berbeda untuk setiap user
    switch (username) {
      case 'ajep':
        return [
          {'text': 'Heyy! Ada info menarik nih', 'isMe': false, 'type': 'text'},
          {'text': 'Tentang apa?', 'isMe': true, 'type': 'text'},
          {'text': 'Tempat makan baru di daerah Senopati, vibesnya keren banget!', 'isMe': false, 'type': 'text'},
          {'text': 'Ohh menarik! Kapan kita kesana?', 'isMe': true, 'type': 'text'},
          {'text': 'Weekend ini gimana? Sabtu atau Minggu?', 'isMe': false, 'type': 'text'},
          {'text': 'Sabtu aja, gue minggu ada acara keluarga', 'isMe': true, 'type': 'text'},
          {'text': 'Siapp! Jam 7 malam oke?', 'isMe': false, 'type': 'text'},
          {'text': 'Perfect! 👌', 'isMe': true, 'type': 'text'},
        ];
      
      case 'hytam':
        return [
          {'text': 'Bro, udah liat film Dune 2 belum?', 'isMe': false, 'type': 'text'},
          {'text': 'Belum, bagus ya? 🤔', 'isMe': true, 'type': 'text'},
          {'text': 'Bagus banget!! Cinematographynya gila sih', 'isMe': false, 'type': 'text'},
          {'text': 'Sent a video', 'isMe': false, 'type': 'notification'},
          {'text': 'Woahhh keliatan epic banget', 'isMe': true, 'type': 'text'},
          {'text': 'Nonton bareng yuk weekend ini', 'isMe': false, 'type': 'text'},
          {'text': 'Boleh! Aku ajak pacar juga ya', 'isMe': true, 'type': 'text'},
          {'text': 'Gaiss jangan jadi mau nonton sendiri aja 😭', 'isMe': false, 'type': 'text'},
          {'text': 'Wkwkwk kidding bro, yok ajak temen lu yang lain juga', 'isMe': true, 'type': 'text'},
        ];
      
      case 'renad':
        return [
          {'text': 'Mentioned you in their story', 'isMe': false, 'type': 'notification'},
          {'text': 'Thanks for the tag! 😊', 'isMe': true, 'type': 'text'},
          {'text': 'Iyaa! Foto kita kemarin di event bagus banget soalnya', 'isMe': false, 'type': 'text'},
          {'text': 'Iya nih, fotografernya jago bgt', 'isMe': true, 'type': 'text'},
          {'text': 'Btw, proposal project kita udah di-approve sama client!', 'isMe': false, 'type': 'text'},
          {'text': 'SERIOUSLY?! 🎉', 'isMe': true, 'type': 'text'},
          {'text': 'Yesss! Kickoff meeting Senin depan', 'isMe': false, 'type': 'text'},
          {'text': 'Mantap! Akhirnya kerja keras kita terbayar', 'isMe': true, 'type': 'text'},
        ];
      
      case 'Margie':
        return [
          {'text': 'Sent a reel by howdyribs_pik', 'isMe': false, 'type': 'notification'},
          {'text': 'Reel tentang resep pasta itu ya? Looks yummy!', 'isMe': true, 'type': 'text'},
          {'text': 'Iyaa! Aku pengen coba bikin, kayaknya gampang', 'isMe': false, 'type': 'text'},
          {'text': 'Gampang kok, aku udah pernah bikin. Mau aku kirim resepnya?', 'isMe': true, 'type': 'text'},
          {'text': 'Mauuu pleaseee 🙏', 'isMe': false, 'type': 'text'},
          {'text': 'Oke tunggu sebentar ya, aku screenshot dari notes', 'isMe': true, 'type': 'text'},
          {'text': 'Sent a photo', 'isMe': true, 'type': 'notification'},
          {'text': 'Thank youuu!! Aku coba weekend ini 😍', 'isMe': false, 'type': 'text'},
        ];
      
      case 'sharon valerie':
        return [
          {'text': 'Hii! Gimana kabarnya?', 'isMe': false, 'type': 'text'},
          {'text': 'Baik! Kamu gimana? Long time no see!', 'isMe': true, 'type': 'text'},
          {'text': 'Baik juga! Aku baru pulang dari Bali kemarin 🏖️', 'isMe': false, 'type': 'text'},
          {'text': 'Wahhh seru! Pergi sama siapa?', 'isMe': true, 'type': 'text'},
          {'text': 'Sama keluarga, family vacation gitu', 'isMe': false, 'type': 'text'},
          {'text': 'Nanti share foto-fotonya dong! Pasti bagus', 'isMe': true, 'type': 'text'},
          {'text': 'Siap! Nanti aku kirim di group chat aja ya', 'isMe': false, 'type': 'text'},
          {'text': 'Oke ditunggu! 📸', 'isMe': true, 'type': 'text'},
        ];
      
      case 'Tenkiuu':
        return [
          {'text': 'Bro, kamu lagi sibuk?', 'isMe': false, 'type': 'text'},
          {'text': 'Lumayan, kenapa emang?', 'isMe': true, 'type': 'text'},
          {'text': 'Aku butuh bantuan edit video nih, bisa bantu?', 'isMe': false, 'type': 'text'},
          {'text': 'Bisa sih, tapi minggu depan ya. Week ini full banget', 'isMe': true, 'type': 'text'},
          {'text': 'Oke deh, gpp! Deadlinenya masih lama kok', 'isMe': false, 'type': 'text'},
          {'text': 'Video apa emang?', 'isMe': true, 'type': 'text'},
          {'text': 'Company profile buat startup temen gue', 'isMe': false, 'type': 'text'},
          {'text': 'Ohh oke, nanti kita diskusi detail ya', 'isMe': true, 'type': 'text'},
          {'text': 'Siapp! Thanks bro 🙌', 'isMe': false, 'type': 'text'},
        ];
      
      case 'Stephanie':
        return [
          {'text': 'Heyy! Jadi dateng ke birthday party Alex gak?', 'isMe': false, 'type': 'text'},
          {'text': 'Jadi kok! Sabtu jam berapa?', 'isMe': true, 'type': 'text'},
          {'text': 'Mulai jam 7, tapi dateng dari jam 6 juga gpp', 'isMe': false, 'type': 'text'},
          {'text': 'Tempatnya dimana?', 'isMe': true, 'type': 'text'},
          {'text': 'Di rooftop barnya dia, SKYE', 'isMe': false, 'type': 'text'},
          {'text': 'Ohhh yang di BCA Tower? Oke noted!', 'isMe': true, 'type': 'text'},
          {'text': 'Yup! Dress code semi formal ya', 'isMe': false, 'type': 'text'},
          {'text': 'Siap! See you there! 👗', 'isMe': true, 'type': 'text'},
        ];
      
      default:
        return [
          {'text': 'Hey there!', 'isMe': false, 'type': 'text'},
          {'text': 'Hi! How are you?', 'isMe': true, 'type': 'text'},
          {'text': "I'm good, thanks! What about you?", 'isMe': false, 'type': 'text'},
          {'text': 'Doing great! 😊', 'isMe': true, 'type': 'text'},
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(widget.userImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.isOnline ? 'Active now' : 'Active 15m ago',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white, size: 24),
            onPressed: () {
              _showRippleEffect(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white, size: 28),
            onPressed: () {
              _showRippleEffect(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(messages[index]);
              },
            ),
          ),
          
          // Input Area
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(color: Colors.grey[900]!),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                // Camera Icon
                IconButton(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3797EF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  onPressed: () {
                    _showRippleEffect(context);
                  },
                ),
                
                // Text Input
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[800]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Message...',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                        // Microphone Icon
                        IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: Colors.grey[500],
                            size: 24,
                          ),
                          onPressed: () {
                            _showRippleEffect(context);
                          },
                        ),
                        // Gallery Icon
                        IconButton(
                          icon: Icon(
                            Icons.image,
                            color: Colors.grey[500],
                            size: 24,
                          ),
                          onPressed: () {
                            _showRippleEffect(context);
                          },
                        ),
                        // Sticker Icon
                        IconButton(
                          icon: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey[500],
                            size: 24,
                          ),
                          onPressed: () {
                            _showRippleEffect(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Plus Icon
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey[500],
                    size: 28,
                  ),
                  onPressed: () {
                    _showRippleEffect(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    if (message['type'] == 'notification') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message['text'],
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    // Regular text message
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            message['isMe'] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message['isMe'])
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(widget.userImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: message['isMe']
                  ? const Color(0xFF3797EF)
                  : const Color(0xFF262626),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message['text'],
              style: TextStyle(
                color: message['isMe'] ? Colors.white : Colors.grey[100],
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRippleEffect(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.grey.withOpacity(0.1),
            child: Container(),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(milliseconds: 300), () {
      overlayEntry.remove();
    });
  }
}