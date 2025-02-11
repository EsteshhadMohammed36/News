import 'package:flutter/material.dart';
import 'package:news/models/category.dart';

class CategoryItem extends StatelessWidget {
  int index;

  CategoryItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(Category.categoriesLight[index].imageName),
    );
  }
}
