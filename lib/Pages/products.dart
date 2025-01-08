import 'package:flutter/material.dart';
import 'package:programming_languages_project/core/Constant/colors.dart';

import '../Widgets/custom_card.dart';
import '../Widgets/products.dart';
import '../Widgets/profile_drawer.dart';

class Products extends StatelessWidget {
  final String title;
  final controller = ListProducts();

  Products({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ProfileDrawer(),
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          shape: LinearBorder.bottom(
              side: BorderSide(width: 1, color: AppColors.primaryColor)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: controller.products[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
