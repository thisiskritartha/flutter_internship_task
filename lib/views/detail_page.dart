import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:internship/controllers/produtct_controller.dart';
import 'package:internship/widgets/fav_icon.dart';

import '../models/product.dart';

class Detail extends StatelessWidget {
  final Product product;
  final String tag;
  Detail({Key? key, required this.product, required this.tag})
      : super(key: key);

  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Details Page',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        // extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: tag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Image.network(
                      product.image,
                      height: 360,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                title: Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
                trailing: FavIcon(product: product),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
