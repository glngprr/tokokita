import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double price;
  final double? originalPrice;

  const PriceLabel({super.key, required this.price, this.originalPrice});

  // Fungsi pembantu format ribuan tanpa dependensi package eksternal
  String _formatRupiah(double amount) {
    String str = amount.toStringAsFixed(0);
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String formatted = str.replaceAllMapped(reg, (Match m) => '${m[1]}.');
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final hasDiscount = originalPrice != null && originalPrice! > price;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Harga Utama (Harga Akhir)
            Text(
              _formatRupiah(price),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            // Harga Asli Dicoret (Hanya tampil jika berdiskon)
            if (hasDiscount) ...[
              const SizedBox(width: 6),
              Text(
                _formatRupiah(originalPrice!),
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
