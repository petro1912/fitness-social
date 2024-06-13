class Activate {
  final String name, description, date;
  final String? img;
  final bool isFavorite;
  final List<String>? images;

  Activate({
    required this.name,
    required this.description,
    required this.date,
    required this.isFavorite,
    this.img,
    this.images,
  });
}
