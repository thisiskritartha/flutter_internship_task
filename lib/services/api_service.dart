import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/product.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e',
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }
}
