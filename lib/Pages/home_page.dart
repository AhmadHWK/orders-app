import 'package:flutter/material.dart';
import 'package:orders-app/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                size: 18,
                Icons.menu,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "products",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              size: 20,
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              size: 20,
              Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 20,
                    ),
                    Text("search"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap:
                      true, //loaded all of items cause it part of screen
                  itemBuilder: (context, index) => productItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 2),
            ],
          ),
        ),
      ),
    );
  }
}
