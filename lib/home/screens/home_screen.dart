import 'package:flutter/material.dart';
import 'package:news/home/screens/categories_view.dart';
import 'package:news/home/screens/news_view.dart';
import 'package:news/home/widgets/home_drawer.dart';
import 'package:news/models/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(
        goToHome: goToHome,
      ),
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.id,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 30,
          ),
          SizedBox(
            width: 16,
          )
        ],
        //titleTextStyle: textTheme.titleLarge,
      ),
      body: selectedCategory == null
          ? CategoriesView(
              onCategorySelected: onCategorySelected,
            )
          : NewsView(
              categoryId: selectedCategory!.id,
            ),
    );
  }

  void onCategorySelected(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  void goToHome() {
    selectedCategory = null;
    setState(() {});
  }
}
