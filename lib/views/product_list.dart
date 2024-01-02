import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:internship/views/detail_page.dart';
import 'package:internship/widgets/fav_icon.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final Product product;
  final String heroTag;
  ProductList(this.product, {super.key, required this.heroTag});

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          Detail(
            product: product,
            tag: heroTag,
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Hero(
              tag: heroTag,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.title,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('\$${product.price}'),
            trailing: FavIcon(product: product),
          ),
        ),
      ),
    );
  }
}
