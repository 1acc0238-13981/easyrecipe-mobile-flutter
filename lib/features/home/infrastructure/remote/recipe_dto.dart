class RecipeDto {
  final int id;
  final String name;
  final String image;
  final double rating;

  const new({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble() ,
    );
  }
}
