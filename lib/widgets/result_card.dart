import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double? result;
  final String formula;
  final Color gradientStart;
  final Color gradientEnd;

  const ResultCard({
    super.key,
    required this.result,
    required this.formula,
    required this.gradientStart,
    required this.gradientEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Rumus:',
              style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 4),
          Text(formula,
              style: const TextStyle(
                  color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic)),
          const Divider(color: Colors.white30, height: 24),
          const Text('Volume:',
              style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            result != null ? '${result!.toStringAsFixed(2)} cm³' : '— cm³',
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}