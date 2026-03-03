import 'package:flutter/material.dart';
import 'dart:math';
import 'package:volume_app/widgets/input_field.dart';
import 'package:volume_app/widgets/result_card.dart';

class KubusScreen extends StatefulWidget {
  const KubusScreen({super.key});

  @override
  State<KubusScreen> createState() => _KubusScreenState();
}

class _KubusScreenState extends State<KubusScreen> {
  final _sisiCtrl = TextEditingController();
  double? _result;

  void _hitung() {
    final s = double.tryParse(_sisiCtrl.text);
    if (s == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nilai sisi yang valid!')),
      );
      return;
    }
    setState(() => _result = pow(s, 3).toDouble());
  }

  void _reset() {
    _sisiCtrl.clear();
    setState(() => _result = null);
  }

  @override
  void dispose() {
    _sisiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kubus',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 232, 26, 129),
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
                color: const Color.fromARGB(255, 243, 206, 221),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 249, 179, 209)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromARGB(255, 232, 26, 129), width: 2),
                    ),
                    child: const Icon(Icons.crop_square_rounded,
                        size: 36, color: Color.fromARGB(255, 232, 26, 129)),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kubus',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Semua sisi memiliki panjang yang sama.',
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

            InputField(controller: _sisiCtrl, label: 'Panjang Sisi (s)', suffix: 'cm'),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _hitung,
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: const Text('Hitung', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 232, 26, 129),
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
              formula: 'V = s³',
              gradientStart: const Color.fromARGB(255, 232, 26, 129),
              gradientEnd: const Color.fromARGB(255, 161, 13, 109),
            ),
          ],
        ),
      ),
    );
  }
}