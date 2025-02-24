import 'package:flutter/material.dart';
import 'package:news/categories/data/models/category.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class CategoriesView extends StatefulWidget {
  CategoriesView({required this.onCategorySelected});

  void Function(Category) onCategorySelected;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  bool isLoading = true;
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) loadCategoriesList();
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
                child: isLoading
                    ? LoadingIndicator()
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16,
                        ),
                        itemCount: Category.categoriesLight.length,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              widget.onCategorySelected(
                                  Category.categoriesLight[index]);
                            },
                            child: CategoryItem(index: index)),
                      ))
          ],
        ));
  }

  void loadCategoriesList() async {
    await Future.delayed(Duration(seconds: 2));
    categories = Category.categoriesLight;
    isLoading = false;
    setState(() {});
  }
}
