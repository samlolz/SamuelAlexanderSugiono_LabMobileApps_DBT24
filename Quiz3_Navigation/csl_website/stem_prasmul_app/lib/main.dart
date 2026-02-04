import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.network(
          "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
          height: 34,
        ),
      ),

      body: Column(
        children: [
          // ===== SCROLLABLE CONTENT =====
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(), // 🔑 INI PENTING
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.network(
                      "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                      height: 130,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "VISION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "To become an internationally recognized institution in STEM education and research.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "MISSION",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Deliver quality education and research in STEM fields through:\n\n"
                      "1. Interdisciplinary and collaborative learning activities\n"
                      "2. Research initiatives that give real contribution to society",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),

                  // EXTRA SPACE BIAR JELAS BISA SCROLL
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // ===== FIXED FOOTER =====
          Container(
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png",
                  height: 40,
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
