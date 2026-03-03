import 'package:flutter/material.dart';
import 'dart:math';
import 'package:volume_app/widgets/input_field.dart';
import 'package:volume_app/widgets/result_card.dart';

class BolaScreen extends StatefulWidget {
  const BolaScreen({super.key});

  @override
  State<BolaScreen> createState() => _BolaScreenState();
}

class _BolaScreenState extends State<BolaScreen> {
  final _jariCtrl = TextEditingController();
  double? _result;

  void _hitung() {
    final r = double.tryParse(_jariCtrl.text);
    if (r == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nilai jari-jari yang valid!')),
      );
      return;
    }
    setState(() => _result = (4 / 3) * pi * pow(r, 3));
  }

  void _reset() {
    _jariCtrl.clear();
    setState(() => _result = null);
  }

  @override
  void dispose() {
    _jariCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bola',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFF29900),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange.shade600, width: 2),
                    ),
                    child: Icon(Icons.circle_rounded,
                        size: 36, color: Colors.orange.shade600),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bola',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Bangun ruang tiga dimensi yang bulat sempurna.',
                            style: TextStyle(fontSize: 13, color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text('Masukkan Data',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),

            InputField(controller: _jariCtrl, label: 'Jari-jari (r)', suffix: 'cm'),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _hitung,
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text('Hitung', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            ResultCard(
              result: _result,
              formula: 'V = (4/3) × π × r³',
              gradientStart: const Color(0xFFF29900),
              gradientEnd: const Color(0xFFc67200),
            ),
          ],
        ),
      ),
    );
  }
}