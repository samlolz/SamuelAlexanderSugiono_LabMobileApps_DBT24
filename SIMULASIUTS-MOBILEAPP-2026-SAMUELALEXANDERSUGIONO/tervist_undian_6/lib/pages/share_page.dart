import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 340));
    _slide = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _dismiss() => _ctrl.reverse().then((_) {
        if (mounted) Navigator.pop(context);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: _dismiss,
            child: Container(color: Colors.black54),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slide,
              child: GestureDetector(
                onTap: () {},
                child: _IosShareSheet(onDismiss: _dismiss),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _IosShareSheet extends StatelessWidget {
  final VoidCallback onDismiss;
  const _IosShareSheet({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF2F2F7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 6),
              width: 36,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFCCCCCC),
                borderRadius: BorderRadius.circular(3),
              ),
            ),

            // Preview card
            _previewCard(),
            const SizedBox(height: 10),

            // ── CONTACTS / SUGGESTED ─────────────────────────────────
            _sectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Text(
                      'Suggested',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E8E93),
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 96,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                      children: const [
                        _ContactBubble(
                          name: 'Gibran',
                          imageUrl: 'https://i.pinimg.com/736x/9c/e8/45/9ce8459a5c22f60a9ef0ecb28c9e47ea.jpg',
                        ),
                        SizedBox(width: 20),
                        _ContactBubble(
                          name: 'My Bro',
                          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5PiW0UMIhf9atpRTnxOjlh33xK54suJobcw&s',
                        ),
                        SizedBox(width: 20),
                        _ContactBubble(
                          name: 'daddy',
                          imageUrl: 'https://m.media-amazon.com/images/M/MV5BNTE1ODU3NTM1N15BMl5BanBnXkFtZTcwNTk0NDM4Nw@@._V1_.jpg',
                        ),
                        SizedBox(width: 20),
                        _ContactBubble(
                          name: 'Putri deltaspa',
                          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo0_HxR_MWlR-nlHoD2Ii-s0MXuH81HoXShA&s',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // App icons row
            _sectionCard(
              child: SizedBox(
                height: 96,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  children: const [
                    _AppIcon(
                        iconData: CupertinoIcons.radiowaves_left,
                        label: 'AirDrop',
                        colors: [Color(0xFF35C5F3), Color(0xFF007AFF)]),
                    SizedBox(width: 18),
                    _AppIcon(
                        iconData: CupertinoIcons.chat_bubble_fill,
                        label: 'Messages',
                        colors: [Color(0xFF3ADD6A), Color(0xFF30C85A)]),
                    SizedBox(width: 18),
                    _AppIcon(
                        iconData: CupertinoIcons.mail_solid,
                        label: 'Mail',
                        colors: [Color(0xFF3478F6), Color(0xFF005DE5)]),
                    SizedBox(width: 18),
                    _AppIcon(
                        iconData: CupertinoIcons.doc_on_doc_fill,
                        label: 'Notes',
                        colors: [Color(0xFFFFDE02), Color(0xFFFFA500)],
                        iconColor: Color(0xFF7D5700)),
                    SizedBox(width: 18),
                    _AppIcon(
                        iconData:
                            CupertinoIcons.list_bullet_below_rectangle,
                        label: 'Reminders',
                        colors: [Color(0xFFFF3B30), Color(0xFFD4261F)]),
                    SizedBox(width: 18),
                    _AppIcon(
                        iconData: CupertinoIcons.ellipsis,
                        label: 'More',
                        colors: [Color(0xFFAEAEB2), Color(0xFF8E8E93)]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Actions list
            _sectionCard(
              child: Column(
                children: [
                  _ActionTile(
                      icon: CupertinoIcons.share, label: 'Copy Link'),
                  _divider(),
                  _ActionTile(
                      icon: CupertinoIcons.square_on_square, label: 'Copy'),
                  _divider(),
                  _ActionTile(
                      icon: CupertinoIcons.arrow_down_to_line_alt,
                      label: 'Save to Gallery'),
                  _divider(),
                  _ActionTile(
                      icon: CupertinoIcons.bookmark, label: 'Add Bookmark'),
                  _divider(),
                  _ActionTile(
                      icon: CupertinoIcons.doc_text,
                      label: 'New Quick Note'),
                  _divider(),
                  _ActionTile(
                    icon: CupertinoIcons.globe,
                    label: 'Open Image on Google',
                    trailing: _CircleBadge(
                        text: 'G',
                        textColor: const Color(0xFF4285F4),
                        bg: Colors.white,
                        hasBorder: true),
                  ),
                  _divider(),
                  _ActionTile(
                    icon: CupertinoIcons.pin_fill,
                    label: 'Save to Pinterest',
                    trailing: _CircleBadge(
                        text: 'P',
                        textColor: Colors.white,
                        bg: const Color(0xFFE60023)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Cancel
            GestureDetector(
              onTap: onDismiss,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: bottomPad + 10),
          ],
        ),
      ),
    );
  }

  Widget _previewCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1DB954), Color(0xFF0E8B3A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.favorite_rounded,
                  color: Colors.white, size: 26),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tervist Activity',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                SizedBox(height: 3),
                Text(
                  "4.89 km  ·  01:18:02  ·  15'58\"/km",
                  style:
                      TextStyle(color: Color(0xFF8E8E93), fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: child,
    );
  }

  Widget _divider() => Container(
        height: 0.5,
        margin: const EdgeInsets.only(left: 52),
        color: const Color(0xFFD1D1D6),
      );
}

// ─────────────────────────────────────────────────────────────────────────────

class _AppIcon extends StatelessWidget {
  final IconData iconData;
  final String label;
  final List<Color> colors;
  final Color? iconColor;
  const _AppIcon(
      {required this.iconData,
      required this.label,
      required this.colors,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                    color: colors.last.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2))
              ],
            ),
            child:
                Icon(iconData, color: iconColor ?? Colors.white, size: 26),
          ),
          const SizedBox(height: 5),
          Text(label,
              style: const TextStyle(fontSize: 11, color: Colors.black)),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  const _ActionTile(
      {required this.icon, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF007AFF), size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontSize: 17, color: Colors.black)),
            ),
            trailing ??
                const Icon(CupertinoIcons.chevron_right,
                    color: Color(0xFFC7C7CC), size: 14),
          ],
        ),
      ),
    );
  }
}

class _CircleBadge extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bg;
  final bool hasBorder;
  const _CircleBadge(
      {required this.text,
      required this.textColor,
      required this.bg,
      this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: hasBorder
            ? Border.all(color: const Color(0xFFD1D1D6))
            : null,
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
      ),
    );
  }
}

class _ContactBubble extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _ContactBubble({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Avatar dari URL — ganti 'https://LINK_FOTO_..._DISINI' dengan URL asli
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 56,
                  height: 56,
                  color: const Color(0xFFBDBDBD),
                  child: const Icon(CupertinoIcons.person_fill,
                      color: Colors.white, size: 28),
                ),
                loadingBuilder: (_, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    width: 56,
                    height: 56,
                    color: const Color(0xFFE0E0E0),
                    child: const Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Color(0xFF007AFF)),
                    ),
                  );
                },
              ),
            ),
            // AirDrop badge
            Positioned(
              bottom: -2,
              right: -2,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF35C5F3), Color(0xFF007AFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(CupertinoIcons.wifi,
                    color: Colors.white, size: 10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(name,
            style: const TextStyle(fontSize: 11, color: Colors.black)),
      ],
    );
  }
}