class ProductModel {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  final int originalPrice;
  final String discount;
  final double rating;
  final int reviewCount;

  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviewCount,
  });
}
