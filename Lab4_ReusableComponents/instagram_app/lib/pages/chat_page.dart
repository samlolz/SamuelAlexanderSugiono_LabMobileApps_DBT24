import 'package:flutter/material.dart';
import 'chat_detail_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> chats = [
  {
    'username': 'bubub',
    'userImage': 'assets/images/cewe1.jpg',
    'message': '2 new messages',
    'time': 'now',
    'isOnline': true,
    'hasUnread': true,
  },
  {
    'username': 'sydney_sweeney',
    'userImage': 'assets/images/cewe2.jpg',
    'message': '4+ new messages',
    'time': '2h',
    'isOnline': false,
    'hasUnread': true,
    'isMuted': true,
  },
  {
    'username': 'aikomaaay',
    'userImage': 'assets/images/cewe3.jpg',
    'message': 'Sent Yesterday',
    'time': '',
    'isOnline': true,
    'hasUnread': false,
  },
  {
    'username': 'vanessa',
    'userImage': 'assets/images/cewe4.jpg',
    'message': 'Sent a reel by himself',
    'time': 'Sent Monday',
    'isOnline': false,
    'hasUnread': false,
  },
  {
    'username': 'jovanca',
    'userImage': 'assets/images/cewe5.jpg',
    'message': 'i miss uu',
    'time': 'Sent Sunday',
    'isOnline': false,
    'hasUnread': true,
  },
  {
    'username': 'michellelop',
    'userImage': 'assets/images/cewe6.jpg',
    'message': 'aku hamil',
    'time': 'Sent Sunday',
    'isOnline': false,
    'hasUnread': true,
  },
  {
    'username': 'jesuyy',
    'userImage': 'assets/images/cewe7.jpg',
    'message': 'plss balikann',
    'time': '',
    'isOnline': false,
    'hasUnread': false,
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Text(
              'samuel.sugiono',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call_outlined, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 26),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF262626),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search or ask Meta AI',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          
          // Messages Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Requests',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return _buildChatItem(chats[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send, size: 26),
            label: 'Messages',
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(Map<String, dynamic> chat) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(
              username: chat['username'],
              userImage: chat['userImage'],
              isOnline: chat['isOnline'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Profile Picture with Online Status
            Stack(
              children: [
                Container(
  width: 56,
  height: 56,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: AssetImage(chat['userImage']),
      fit: BoxFit.cover,
    ),
  ),
),
                if (chat['isOnline'])
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF44C153),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            
            // Username and Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat['username'],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: chat['hasUnread']
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    chat['message'],
                    style: TextStyle(
                      fontSize: 14,
                      color: chat['hasUnread']
                          ? Colors.grey[300]
                          : Colors.grey[600],
                      fontWeight: chat['hasUnread']
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Time and Icons
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (chat['time'].isNotEmpty)
                  Text(
                    chat['time'],
                    style: TextStyle(
                      fontSize: 13,
                      color: chat['hasUnread']
                          ? Colors.grey[300]
                          : Colors.grey[600],
                    ),
                  ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (chat['hasUnread'])
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3797EF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    if (chat['isMuted'] == true) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.notifications_off,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                    ],
                    const SizedBox(width: 8),
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 22,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}