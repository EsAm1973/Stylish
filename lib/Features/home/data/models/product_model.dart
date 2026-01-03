import 'package:stylish/Features/home/data/models/category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String? slug;
  final int price;
  final String description;
  final List<String> images;
  final CategoryModel category;
  final String? creationAt;
  final String? updatedAt;
  final int? originalPrice;
  final String? discount;
  final double? rating;
  final int? reviewCount;

  ProductModel({
    required this.id,
    required this.title,
    this.slug,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
    this.creationAt,
    this.updatedAt,
    this.originalPrice,
    this.discount,
    this.rating,
    this.reviewCount,
  });

  String get imageUrl => images.isNotEmpty ? images[0] : '';

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      slug: json['slug'],
      price: int.parse(json['price'].toString()),
      description: json['description'],
      images: List<String>.from(json['images']),
      category: CategoryModel.fromJson(json['category']),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
      originalPrice: json['originalPrice'],
      discount: json['discount'],
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'images': images,
      'category': category.toJson(),
      'creationAt': creationAt,
      'updatedAt': updatedAt,
      'originalPrice': originalPrice,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}
