import 'package:flutter/material.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, String>> stories = [
    {
      'username': 'Your story',
      'image': 'https://i.pravatar.cc/150?img=1',
      'hasStory': 'false'
    },
    {
      'username': 'jnthn_wang',
      'image': 'https://i.pravatar.cc/150?img=12'
    },
    {
      'username': 'jokowi',
      'image': 'https://i.pravatar.cc/150?img=13'
    },
    {
      'username': 'leon',
      'image': 'https://i.pravatar.cc/150?img=14'
    },
    {
      'username': 'sarah.kim',
      'image': 'https://i.pravatar.cc/150?img=5'
    },
    {
      'username': 'alex_chen',
      'image': 'https://i.pravatar.cc/150?img=33'
    },
    {
      'username': 'michael.b',
      'image': 'https://i.pravatar.cc/150?img=15'
    },
    {
      'username': 'jessica_lee',
      'image': 'https://i.pravatar.cc/150?img=25'
    },
    {
      'username': 'david.park',
      'image': 'https://i.pravatar.cc/150?img=17'
    },
    {
      'username': 'emma_wong',
      'image': 'https://i.pravatar.cc/150?img=23'
    },
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'username': 'peter.bryants',
      'userImage': 'https://i.pravatar.cc/150?img=60',
      'postImages': [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      ],
      'likes': '1,234',
      'caption': 'Beautiful sunset at the beach 🌅',
      'comments': '45',
      'time': '5 minutes ago',
    },
    {
      'username': 'travel.diary',
      'userImage': 'https://i.pravatar.cc/150?img=35',
      'postImages': [
        'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800',
        'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800',
        'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800',
      ],
      'likes': '5,678',
      'caption': 'Exploring the mountains! 🏔️ #adventure #nature',
      'comments': '123',
      'time': '1 hour ago',
    },
    {
      'username': 'foodie_life',
      'userImage': 'https://i.pravatar.cc/150?img=44',
      'postImages': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800',
      ],
      'likes': '3,456',
      'caption': 'Delicious homemade pasta 🍝',
      'comments': '89',
      'time': '3 hours ago',
    },
    {
      'username': 'fitness.goals',
      'userImage': 'https://i.pravatar.cc/150?img=52',
      'postImages': [
        'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=800',
        'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800',
      ],
      'likes': '2,890',
      'caption': 'Morning workout routine 💪 #fitness #health',
      'comments': '67',
      'time': '6 hours ago',
    },
    {
      'username': 'art.studio',
      'userImage': 'https://i.pravatar.cc/150?img=28',
      'postImages': [
        'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800',
      ],
      'likes': '4,123',
      'caption': 'New painting finished today 🎨',
      'comments': '156',
      'time': '12 hours ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2560px-Instagram_logo.svg.png',
          height: 35,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Section
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return _buildStoryItem(
                    stories[index]['username']!,
                    stories[index]['image']!,
                    index == 0,
                  );
                },
              ),
            ),
            Divider(height: 1, color: Colors.grey[900]),
            
            // Posts Section
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return _buildPostItem(posts[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage()),
            );
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
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined, size: 26),
            label: 'Messages',
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String username, String image, bool isYourStory) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isYourStory
                      ? null
                      : const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFFCAF45),
                            Color(0xFFF77737),
                            Color(0xFFE1306C),
                            Color(0xFFC13584),
                            Color(0xFF833AB4),
                          ],
                        ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              if (isYourStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3797EF),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 76,
            child: Text(
              username,
              style: const TextStyle(fontSize: 12, color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(Map<String, dynamic> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFFCAF45),
                      Color(0xFFE1306C),
                      Color(0xFF833AB4),
                    ],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(post['userImage']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                post['username'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        
        // Post Image(s) with Carousel
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: post['postImages'].length,
            itemBuilder: (context, index) {
              return Image.network(
                post['postImages'][index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        
        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 28, color: Colors.white),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.mode_comment_outlined, size: 26, color: Colors.white),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.send_outlined, size: 26, color: Colors.white),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              if (post['postImages'].length > 1)
                Row(
                  children: List.generate(
                    post['postImages'].length,
                    (index) => Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0
                            ? const Color(0xFF3797EF)
                            : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border, size: 26, color: Colors.white),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        
        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            '${post['likes']} likes',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
        
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 13),
              children: [
                TextSpan(
                  text: post['username'],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const TextSpan(text: ' '),
                TextSpan(text: post['caption']),
              ],
            ),
          ),
        ),
        
        // View Comments
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          child: Text(
            'View all ${post['comments']} comments',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
        ),
        
        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          child: Text(
            post['time'],
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}