import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    try {
      var response =
          await client.get(Uri.parse('http://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return productFromJson(jsonString);
      } else {
        Get.snackbar('${response.statusCode}',
            'Error in fetching the Data. Please try again later.');
        return null;
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to fetch products. $error');
      return null;
    }
  }
}
