import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:internship/views/product_list.dart';
import 'package:internship/views/product_tile.dart';
import '../controllers/produtct_controller.dart';

class CartList extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Cart List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              productController.clearCartList();
            },
            icon: Icon(Icons.clear_sharp),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'OnlineStore',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {
                      productController.isTile.value = false;
                    }),
                IconButton(
                    icon: const Icon(Icons.grid_view),
                    onPressed: () {
                      productController.isTile.value = true;
                    }),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => MasonryGridView.count(
                crossAxisCount: productController.isTile.value ? 2 : 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                itemCount: productController.cartList.length,
                itemBuilder: (context, index) {
                  return productController.isTile.value
                      ? ProductTile(productController.cartList[index])
                      : ProductList(productController.cartList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
