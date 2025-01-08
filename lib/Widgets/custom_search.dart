import 'package:flutter/material.dart';
import 'package:programming_languages_project/core/Constant/colors.dart';

class CustomSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClosed;

  const CustomSearchAppBar({
    required this.title,
    required this.onSearchChanged,
    required this.onSearchClosed,
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  CustomSearchAppBarState createState() => CustomSearchAppBarState();
}

class CustomSearchAppBarState extends State<CustomSearchAppBar> {
  bool isSearching = false;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shape: LinearBorder.bottom(
          side: BorderSide(width: 1, color: AppColors.primaryColor)),
      title: isSearching
          ? TextField(
              controller: searchController,
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'البحث ...',
                hintStyle: const TextStyle(color: Colors.white70),
              ),
              onChanged: widget.onSearchChanged,
            )
          : Text(widget.title),
      actions: [
        if (isSearching)
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() => isSearching = false);
              searchController.clear();
              widget.onSearchClosed();
            },
          )
        else
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => setState(() => isSearching = true),
          ),
      ],
    );
  }
}
