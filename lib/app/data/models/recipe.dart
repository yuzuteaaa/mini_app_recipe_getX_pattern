class Recipe {
  final int id;
  final String title;
  final String description;
  final String photoUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.photoUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      photoUrl: json['photo_url'],
    );
  }
}