class Product {
  final String name;
  final String number;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.number,
    required this.description,
    required this.imageUrl,
  });
}

class ListProducts {
  List<Product> products = [
    Product(
      name: "Laptop",
      number: "101",
      description: "High-performance laptop for productivity.",
      imageUrl: "assets/images/Laptop.jpg",
    ),
    Product(
      name: "Smartphone",
      number: "102",
      description: "Latest model with advanced features.",
      imageUrl: "assets/images/Mobile.jpg",
    ),
    Product(
      name: "Headphones",
      number: "103",
      description: "Noise-cancelling over-ear headphones.",
      imageUrl: "assets/images/headphone.jpg",
    ),
    Product(
      name: "Desk Chair",
      number: "104",
      description: "Ergonomic chair with lumbar support.",
      imageUrl: "assets/images/Desk_chair.jpg",
    ),
    Product(
      name: "Coffee Maker",
      number: "105",
      description: "Automatic coffee maker for quick brewing.",
      imageUrl: "assets/images/cafemachine.jpg",
    ),
    Product(
      name: "Bluetooth Speaker",
      number: "106",
      description: "Portable speaker with excellent sound quality.",
      imageUrl: "assets/images/Speaker.jpg",
    ),
    Product(
      name: "Fitness Tracker",
      number: "107",
      description: "Tracks your fitness activities and health stats.",
      imageUrl: "assets/images/FitnessTracker.jpg",
    ),
    Product(
      name: "Smartwatch",
      number: "108",
      description: "Stylish watch with advanced health features.",
      imageUrl: "assets/images/watch.jpg",
    ),
    Product(
      name: "Gaming Console",
      number: "109",
      description: "Experience immersive gaming with the latest console.",
      imageUrl: "assets/images/gaming.jpg",
    ),
    Product(
      name: "Camera",
      number: "110",
      description: "Professional-grade camera for high-quality photos.",
      imageUrl: "assets/images/camera.jpg",
    ),
  ];
}
