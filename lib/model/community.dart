class Community {
  final String name;
  final String? img;
  final int members;
  final String topic;
  final bool isFavorite;

  Community({
    this.img, 
    required this.name, 
    required this.members, 
    required this.topic, 
    required this.isFavorite
  });
}
