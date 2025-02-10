import 'package:flutter/material.dart';
import 'package:news/home/widgets/category_item.dart';
import 'package:news/models/category.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({required this.onCategorySelected});

  void Function(Category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Good Morning \nHere is Some News For You",
              style: textTheme.titleMedium,
            ),
            Expanded(
                child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: Category.categoriesLight.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategorySelected(Category.categoriesLight[index]);
                  },
                  child: CategoryItem(index: index)),
            ))
          ],
        ));
  }
}
