import 'package:flutter/material.dart';
import 'package:volume_app/screens/kubus_screen.dart';
import 'package:volume_app/screens/tabung_screen.dart';
import 'package:volume_app/screens/bola_screen.dart';
import 'package:volume_app/widgets/shape_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1A73E8).withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kalkulator Volume',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Pilih bangun ruang untuk menghitung volumenya',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              const Text('Pilih Bangun Ruang',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E))),
              const SizedBox(height: 4),
              const Text('Ketuk salah satu untuk mulai menghitung',
                  style: TextStyle(fontSize: 13, color: Colors.black45)),

              const SizedBox(height: 20),

              ShapeCard(
                title: 'Kubus',
                subtitle: 'Hitung volume kubus\ndengan memasukkan panjang sisi',
                formula: 'V = s³',
                icon: Icons.crop_square_rounded,
                color: const Color(0xFF1A73E8),
                bgColor: const Color(0xFFE8F0FE),
                borderColor: const Color(0xFFB3C8F9),
                isCircle: false,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const KubusScreen())),
              ),

              const SizedBox(height: 16),

              ShapeCard(
                title: 'Tabung',
                subtitle: 'Hitung volume tabung\ndengan jari-jari dan tinggi',
                formula: 'V = π × r² × t',
                icon: Icons.propane_tank_rounded,
                color: const Color(0xFF34A853),
                bgColor: const Color(0xFFE6F4EA),
                borderColor: const Color(0xFFA8D9B3),
                isCircle: false,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const TabungScreen())),
              ),

              const SizedBox(height: 16),

              ShapeCard(
                title: 'Bola',
                subtitle: 'Hitung volume bola\ndengan memasukkan jari-jari',
                formula: 'V = (4/3) × π × r³',
                icon: Icons.circle_rounded,
                color: const Color(0xFFF29900),
                bgColor: const Color(0xFFFFF3E0),
                borderColor: const Color(0xFFFFCA7A),
                isCircle: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const BolaScreen())),
              ),

              const SizedBox(height: 32),

              const Center(
                child: Text(
                  'Pemrograman Perangkat Mobile • Alfidya Kurnia',
                  style: TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}