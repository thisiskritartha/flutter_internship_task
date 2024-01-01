import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:internship/views/cart_tile.dart';
import 'package:internship/views/product_list.dart';
import 'package:internship/views/product_tile.dart';
import '../controllers/produtct_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: const Icon(
        //   Icons.arrow_back_ios,
        // ),
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
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(CartList());
            },
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
                Obx(
                  () => IconButton(
                      icon: Icon(
                        Icons.view_list_rounded,
                        color: productController.isTileSelected.value
                            ? Colors.grey
                            : Colors.black,
                      ),
                      onPressed: () {
                        productController.isTile.value = false;
                        productController.isTileSelected.value = false;
                      }),
                ),
                Obx(
                  () => IconButton(
                      icon: Icon(
                        Icons.grid_view,
                        color: productController.isTileSelected.value
                            ? Colors.black
                            : Colors.grey,
                      ),
                      onPressed: () {
                        productController.isTile.value = true;
                        productController.isTileSelected.value = true;
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => MasonryGridView.count(
                crossAxisCount: productController.isTile.value ? 2 : 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return productController.isTile.value
                      ? ProductTile(productController.productList[index])
                      : ProductList(productController.productList[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
