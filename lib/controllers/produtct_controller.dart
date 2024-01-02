import 'package:get/get.dart';
import 'package:internship/services/remote_services.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var cartList = <Product>[].obs;
  RxBool isTile = RxBool(true);

  RxBool isTileSelected = RxBool(true);

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteServices.fetchProducts();

    productList.value = products!;
  }

  void addToCart(Product product) {
    if (!cartList.contains(product)) cartList.add(product);

    Get.snackbar('Cart List', '${product.title} added to cart successfully.');
  }

  void removeFromCart(Product product) {
    if (cartList.contains(product)) cartList.remove(product);
    Get.snackbar(
        'Cart List', '${product.title} from cart list removed successfully.');
  }

  void clearCartList() {
    cartList.clear();
    Get.snackbar(
      'Cart List',
      'Cart list cleared successfully.',
    );
  }
}
