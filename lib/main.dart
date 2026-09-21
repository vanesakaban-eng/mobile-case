import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BerandaScreen(),
    );
  }
}

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Katalog Paket"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // Card 1
          TieredPricingCard(
            title: "Paket Pemula",
            price: "Rp 1.500.000",
            description: "Solusi tepat untuk bisnis yang baru mulai go digital.",
            color: Colors.green,
            isRecommended: false,
          ),
          SizedBox(height: 20),
          // Card 2
          TieredPricingCard(
            title: "Paket Profesional",
            price: "Rp 5.000.000",
            description: "Solusi lengkap untuk kebutuhan bisnis digital Anda.",
            color: Colors.blueAccent,
            isRecommended: true,
          ),
          SizedBox(height: 20),
       
          TieredPricingCard(
            title: "Paket Enterprise",
            price: "Rp 12.000.000",
            description: "Fitur tanpa batas untuk skala perusahaan besar.",
            color: Colors.purple,
            isRecommended: false,
          ),
        ],
      ),
    );
  }
}


class TieredPricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final Color color;
  final bool isRecommended;

  const TieredPricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
    required this.isRecommended,
  });

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailKatalogScreen(
          title: title,
          price: price,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menggunakan ListTile untuk memenuhi poin requirement (a)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.laptop_mac, size: 40, color: color),
                title: GestureDetector(
                  onTap: () => _navigateToDetail(context), // Klik pada Title
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "/ proyek",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Column(
                children: [
                  FeatureItem(text: "Desain UI/UX Khusus"),
                  SizedBox(height: 8),
                  FeatureItem(text: "Setup Database"),
                  SizedBox(height: 8),
                  FeatureItem(text: "Integrasi API Payment"),
                  SizedBox(height: 8),
                  FeatureItem(text: "Dukungan Teknis 24/7"),
                ],
              ),
              const SizedBox(height: 24),
              // Tombol Call to Action (CTA)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _navigateToDetail(context), // Klik pada CTA
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "Pilih Paket",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isRecommended)
          Positioned(
            top: -10,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                "Rekomendasi",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check, size: 18, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}


class DetailKatalogScreen extends StatefulWidget {
  final String title;
  final String price;
  final String description;

  const DetailKatalogScreen({
    super.key,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  State<DetailKatalogScreen> createState() => _DetailKatalogScreenState();
}

class _DetailKatalogScreenState extends State<DetailKatalogScreen> {
  // Variabel state interaktif
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Katalog"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // Icon back bawaan/custom untuk kembali ke Screen 1
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Tombol interaktif merubah State
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.blueAccent : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // Container latar warna pastel untuk deskripsi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50], // Warna pastel
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}