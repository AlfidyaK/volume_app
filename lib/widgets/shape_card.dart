import 'package:flutter/material.dart';

class ShapeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String formula;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final bool isCircle;
  final VoidCallback onTap;

  const ShapeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formula,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.isCircle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon box
            Container(
              width: 64, height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: isCircle
                    ? BorderRadius.circular(32)
                    : BorderRadius.circular(14),
                border: Border.all(color: color, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 16),
            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A2E))),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black45, height: 1.4)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(formula,
                        style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: color),
          ],
        ),
      ),
    );
  }
}