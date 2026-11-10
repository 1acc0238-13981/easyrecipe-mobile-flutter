class RecipeToCookDto {
  final int id;
  final String name;
  final String image;
  final String cuisine;
  final String addedAt;

  const new({
    required this.id,
    required this.name,
    required this.image,
    required this.cuisine,
    required this.addedAt,
  });

  factory RecipeToCookDto.fromJson(Map<String, dynamic> json) {
    return RecipeToCookDto(
      id: json['recipeId'],
      name: json['name'],
      image: json['image'],
      cuisine: json['cuisine'],
      addedAt: json['addedAt'],
    );
  }
}
