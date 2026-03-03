import 'package:flutter/material.dart';
import 'dart:math';
import 'package:volume_app/widgets/input_field.dart';
import 'package:volume_app/widgets/result_card.dart';

class TabungScreen extends StatefulWidget {
  const TabungScreen({super.key});

  @override
  State<TabungScreen> createState() => _TabungScreenState();
}

class _TabungScreenState extends State<TabungScreen> {
  final _jariCtrl   = TextEditingController();
  final _tinggiCtrl = TextEditingController();
  double? _result;

  void _hitung() {
    final r = double.tryParse(_jariCtrl.text);
    final t = double.tryParse(_tinggiCtrl.text);
    if (r == null || t == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan semua nilai yang valid!')),
      );
      return;
    }
    setState(() => _result = pi * pow(r, 2) * t);
  }

  void _reset() {
    _jariCtrl.clear();
    _tinggiCtrl.clear();
    setState(() => _result = null);
  }

  @override
  void dispose() {
    _jariCtrl.dispose();
    _tinggiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabung',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF34A853),
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
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade600, width: 2),
                    ),
                    child: Icon(Icons.propane_tank_rounded,
                        size: 36, color: Colors.green.shade600),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tabung',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Bangun ruang dengan alas dan tutup berbentuk lingkaran.',
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

            InputField(controller: _jariCtrl,   label: 'Jari-jari (r)', suffix: 'cm'),
            const SizedBox(height: 12),
            InputField(controller: _tinggiCtrl, label: 'Tinggi (t)',     suffix: 'cm'),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _hitung,
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text('Hitung', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
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
              formula: 'V = π × r² × t',
              gradientStart: const Color(0xFF34A853),
              gradientEnd: const Color(0xFF1B6E34),
            ),
          ],
        ),
      ),
    );
  }
}