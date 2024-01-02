import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:internship/views/cart_tile.dart';
import 'package:internship/widgets/product_views.dart';
import '../controllers/produtct_controller.dart';
import '../widgets/grid_views.dart';
import 'custom_search_delegate.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Get.to(CartList());
          },
        ),
        title: Text(
          'Homepage',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ProductViews(),
          CustomGridViews(list: productController.productList),
        ],
      ),
    );
  }
}
