import 'package:flutter/material.dart';
import 'package:programming_languages_project/Widgets/profile_drawer.dart';

import '../core/Constant/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: AppBar(
        title: Text('السلة '),
        centerTitle: true,
        shape: LinearBorder.bottom(
            side: BorderSide(width: 1, color: AppColors.primaryColor)),
      ),
    );
  }
}
