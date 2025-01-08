import 'package:flutter/material.dart';
import 'package:programming_languages_project/core/Constant/colors.dart';

import '../Widgets/profile_drawer.dart';

class FavoratePage extends StatelessWidget {
  const FavoratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: AppBar(
        title: Text('المفضلة'),
        centerTitle: true,
        shape: LinearBorder.bottom(
            side: BorderSide(width: 1, color: AppColors.primaryColor)),
      ),
    );
  }
}
