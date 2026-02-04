import 'package:flutter/material.dart';
import 'library_page.dart';
import 'profile_page.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, height: 1.5),
      ),
    );
  }

  Widget menuCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.red),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Image.network(
          "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
          height: 34,
          color: Colors.white,
        ),
      ),

      // ===== SIDEBAR =====
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "MENU",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Library"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LibraryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      // ===== BODY =====
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LOGO BIRU
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                      height: 110,
                    ),
                  ),

                  sectionTitle("About STEM"),
                  sectionText(
                    "STEM education at Universitas Prasetiya Mulya is designed to prepare students to face global challenges through the integration of science, technology, engineering, and mathematics. This approach emphasizes critical thinking, problem solving, and innovation, while also encouraging an entrepreneurial mindset. Through STEM education, students are expected to develop the ability to create sustainable and impactful solutions for real-world issues."
                  ),

                  const SizedBox(height: 16),

                  sectionTitle("Vision"),
                  sectionText(
                    "To become a globally recognized institution in STEM-based education and research, producing graduates who are innovative, adaptive, and capable of contributing positively to the development of society at both national and international levels.",
                  ),

                  const SizedBox(height: 16),

                  sectionTitle("Mission"),
                  sectionText(
                    "• Deliver collaborative and interdisciplinary STEM learning\n"
                    "• Conduct impactful research for society",
                  ),

                  const SizedBox(height: 24),

                  sectionTitle("Quick Access"),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        _MenuCard(icon: Icons.school, title: "Admission"),
                        _MenuCard(icon: Icons.groups, title: "People"),
                        _MenuCard(icon: Icons.science, title: "Laboratory"),
                        _MenuCard(icon: Icons.apartment, title: "Campus Life"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===== FOOTER =====
          Container(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Image(
                  image: NetworkImage(
                    "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                  ),
                  height: 36,
                  color: Colors.white,
                ),
                SizedBox(height: 6),
                Text(
                  "BSD City Kavling Edutown I.1\n"
                  "Jl. BSD Raya Utama, Tangerang\n"
                  "Tel. (021) 30450500 | info@prasetiyamulya.ac.id",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===== SMALL CARD WIDGET =====
class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: const Color.fromARGB(255, 0, 0, 0)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
