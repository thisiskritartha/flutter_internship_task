import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final Product product;
  ProductList(this.product, {super.key});

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
          title: Text(
            product.title,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('\$${product.price}'),
          trailing: Obx(
            () => IconButton(
              icon: product.isFavorite.value
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                product.isFavorite.toggle();
                product.isFavorite.value
                    ? productController.addToCart(product)
                    : productController.removeFromCart(product);
              },
            ),
          ),
        ),
      ),
    );
  }
}
