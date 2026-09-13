class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final String? description; // Nullable

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String getStatusStok() {
    if (stock > 10) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }

  void printDetails() {
    print("[$id] $name | Kategori: $category");
    print(
      "Harga: Rp${price.toStringAsFixed(0)} | Stok: $stock ($getStatusStok())",
    );
    print("Deskripsi: ${description ?? 'Tidak ada deskripsi'}");
  }
}

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double getFinalPrice() {
    return price - (price * (discountPercent / 100));
  }

  @override
  void printDetails() {
    super.printDetails();
    print("Diskon: ${discountPercent.toStringAsFixed(0)}%");
    print("Harga Akhir: Rp${getFinalPrice().toStringAsFixed(0)}");
  }
}

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    if (item is DiscountedProduct) {
      total += item.getFinalPrice();
    } else {
      total += item.price;
    }
  }
  return total;
}

List<Product> dummyProducts = [
  Product(
    id: 1,
    name: "Keyboard Mechanical",
    price: 450000.0,
    imageUrl: "assets/images/keyboard.png",
    category: "Elektronik",
    stock: 12,
    description: "Switch blue tactile dengan backlight RGB dinamis.",
  ),
  Product(
    id: 2,
    name: "Mouse Wireless",
    price: 250000.0,
    imageUrl: "assets/images/mouse.png",
    category: "Elektronik",
    stock: 5,
    description: "Sensor optik 16000 DPI dengan baterai tahan lama.",
  ),
  Product(
    id: 3,
    name: "Monitor 24 Inch 144Hz",
    price: 1850000.0,
    imageUrl: "assets/images/monitor.png",
    category: "Elektronik",
    stock: 0,
    description: "Panel IPS borderless cocok untuk multitasking dan gaming.",
  ),
  Product(
    id: 4,
    name: "Kaos Polos Cotton Combed 30s",
    price: 65000.0,
    imageUrl: "assets/images/kaos.png",
    category: "Fashion",
    stock: 45,
    description: "Bahan adem, menyerap keringat, jahitan rapi rantai.",
  ),
  DiscountedProduct(
    id: 5,
    name: "Jaket Hoodie Zipper",
    price: 200000.0,
    imageUrl: "assets/images/hoodie.png",
    category: "Fashion",
    stock: 8,
    description: "Bahan katun fleece tebal dan hangat.",
    discountPercent: 15.0,
  ),
  Product(
    id: 6,
    name: "Sweetpants",
    price: 175000.0,
    imageUrl: "assets/images/chino.png",
    category: "Fashion",
    stock: 14,
    description: null, // Nullable test
  ),
  Product(
    id: 7,
    name: "Kopi Arabika 250g",
    price: 75000.0,
    imageUrl: "assets/images/kopi.png",
    category: "Makanan",
    stock: 25,
    description:
        "Single origin roast medium dengan cita rasa floral dan fruity.",
  ),
  DiscountedProduct(
    id: 8,
    name: "Camilan Keripik Singkong Balado",
    price: 20000.0,
    imageUrl: "assets/images/keripik.png",
    category: "Makanan",
    stock: 30,
    description: "Renyah, gurih, bumbu balado asli tanpa pengawet buatan.",
    discountPercent: 10.0,
  ),
];

void main() {
  print("=== DAFTAR PRODUK TOKOKITA ===");
  for (var p in dummyProducts) {
    p.printDetails();
    print("---------------------------------");
  }

  print("\n=== UJI HITUNG TOTAL BELANJA ===");

  List<Product> keranjang = [
    dummyProducts[0],
    dummyProducts[4],
    dummyProducts[7],
  ];

  print("Daftar Barang yang Dibeli:");
  for (int i = 0; i < keranjang.length; i++) {
    var item = keranjang[i];
    if (item is DiscountedProduct) {
      print(
        "${i + 1}. ${item.name} -> Rp${item.getFinalPrice().toStringAsFixed(0)} (Diskon ${item.discountPercent.toStringAsFixed(0)}% dari Rp${item.price.toStringAsFixed(0)})",
      );
    } else {
      print("${i + 1}. ${item.name} -> Rp${item.price.toStringAsFixed(0)}");
    }
  }

  double total = hitungTotalBelanja(keranjang);
  print("---------------------------------");
  print("Jumlah item di keranjang : ${keranjang.length}");
  print("Total yang harus dibayar : Rp${total.toStringAsFixed(0)}");
}
