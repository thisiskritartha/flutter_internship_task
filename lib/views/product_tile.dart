import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product, {super.key});

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
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
                      )),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text('\$${product.price}', style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
