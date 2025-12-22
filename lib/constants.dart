import 'package:stylish/Features/home/data/models/product_model.dart';

const isOnboadingViewSeenKey = 'is_onboarding_view_seen';
const isGetStartedViewSeenKey = 'is_get_started_view_seen';

// Mock list of products
final List<ProductModel> products = [
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'Women Printed Kurta',
    description: 'Neque porro quisquam est qui dolorem ipsum quia',
    price: 1500,
    originalPrice: 2499,
    discount: '40%Off',
    rating: 4.5,
    reviewCount: 56890,
  ),
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'HRX by Hrithik Roshan',
    description: 'Neque porro quisquam est qui dolorem ipsum quia',
    price: 2499,
    originalPrice: 4999,
    discount: '50%Off',
    rating: 4.0,
    reviewCount: 344567,
  ),
  // Add more mock products here to test scrolling
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'Another printed Kurta',
    description: 'Short description here.',
    price: 1200,
    originalPrice: 2000,
    discount: '40%Off',
    rating: 4.2,
    reviewCount: 1234,
  ),
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'Running Shoes',
    description: 'Comfortable running shoes.',
    price: 3000,
    originalPrice: 6000,
    discount: '50%Off',
    rating: 4.8,
    reviewCount: 5678,
  ),
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'Another printed Kurta',
    description: 'Short description here.',
    price: 1200,
    originalPrice: 2000,
    discount: '40%Off',
    rating: 4.2,
    reviewCount: 1234,
  ),
  ProductModel(
    imageUrl: 'assets/images/product_test.jpg',
    title: 'Running Shoes',
    description: 'Comfortable running shoes.',
    price: 3000,
    originalPrice: 6000,
    discount: '50%Off',
    rating: 4.8,
    reviewCount: 5678,
  ),
];
