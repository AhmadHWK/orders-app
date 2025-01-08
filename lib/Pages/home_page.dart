import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_languages_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:programming_languages_project/Pages/cart_page.dart';
import 'package:programming_languages_project/Pages/explorer_page.dart';
import 'package:programming_languages_project/Pages/products.dart';
import 'package:programming_languages_project/Pages/shops_page.dart';
import 'package:programming_languages_project/core/Constant/colors.dart';

import '../Widgets/show_custom_toast.dart';
import 'favorate_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _isSelected = 0;
  List<Widget> listPages = [
    Products(
      title: 'المنتجات',
    ),
    ExplorerPage(),
    FavoratePage(),
    CartPage(),
    ShopsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          showCustomToast(message: state.message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            'signup',
            (route) => false,
          );
        } else if (state is LogOutFailure) {
          showCustomToast(message: state.errMessage);
        }
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: AppColors.primaryColor)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.thirdColor,
            currentIndex: _isSelected,
            onTap: (page) => setState(() {
              _isSelected = page;
            }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits),
                  label: 'المنتجات'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'المفضلة'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'السلة'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'المتاجر'),
            ],
          ),
        ),
        body: listPages.elementAt(_isSelected),
      ),
    );
  }
}
