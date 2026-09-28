import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({super.key, required this.status});

  Color _getStatusColor() {
    switch (status) {
      case 'Tersedia':
        return const Color(0xFF2E7D32);
      case 'Stok Terbatas':
        return const Color(0xFFED6C02);
      case 'Habis':
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          0.92,
        ), // Background putih solid semi-transparan
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.6), width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
