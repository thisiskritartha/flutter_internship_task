import 'package:http/http.dart' as http;
import '../models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse('http://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
