import 'package:flutter/material.dart';

import '../Widgets/profile_drawer.dart';
import '../core/Constant/colors.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: AppBar(
        title: Text('المتاجر'),
        centerTitle: true,
        shape: LinearBorder.bottom(
            side: BorderSide(width: 1, color: AppColors.primaryColor)),
      ),
      body: ShopGridView(),
    );
  }
}

class ShopGridView extends StatelessWidget {
  final List<Map<String, String>> shops = [
    {
      "name": "Samsung",
      "image": "https://example.com/samsung.jpg",
    },
    {
      "name": "Sony",
      "image": "https://example.com/sony.jpg",
    },
    {
      "name": "Apple",
      "image": "https://example.com/apple.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
          ),
          itemCount: shops.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        shops[index]["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      shops[index]["name"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
