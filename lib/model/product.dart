class Product {
  Product({
    required this.name, 
    required this.description, 
    required this.price, 
    this.img, 
    this.images
  });
  final String name, description;
  final String? img;
  final double price;
  final List<String>? images;
}
