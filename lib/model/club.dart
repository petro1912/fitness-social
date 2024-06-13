class Club {
  final String name;
  final String? description;
  final int members;
  final String? img;
  final List<String>? icons;

  Club({
    required this.name, 
    this.img, 
    this.description, 
    required this.members, 
    this.icons
  });
}
