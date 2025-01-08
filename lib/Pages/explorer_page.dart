import 'package:flutter/material.dart';
import 'package:programming_languages_project/Widgets/custom_search.dart';

import '../Widgets/profile_drawer.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  String searchText = '';

  void handleSearch(String query) {
    setState(() {
      searchText = query;
    });
  }

  void handleSearchClosed() {
    setState(() {
      searchText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: CustomSearchAppBar(
          title: 'البحث',
          onSearchChanged: handleSearch,
          onSearchClosed: handleSearchClosed),
      body: Container(),
    );
  }
}
