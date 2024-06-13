class Diet {
  Diet({
    required this.name, 
    required this.img, 
    required this.kcal, 
    required this.ingredients, 
    required this.condiments
  });
  
  final String img;
  final String name;
  final List ingredients;
  final List condiments;
  final int kcal;
}
