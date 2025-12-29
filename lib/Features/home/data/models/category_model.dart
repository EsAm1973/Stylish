class CategoryModel {
  final int id;
  final String name;
  final String? slug;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'slug': slug, 'image': image};
  }
}
