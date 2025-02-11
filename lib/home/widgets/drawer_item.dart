import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class DrawerItem extends StatelessWidget {
  String iconName;
  String title;
  String choice;

  DrawerItem({
    required this.title,
    required this.iconName,
    required this.choice,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Divider(
            indent: 0,
            endIndent: 0,
            color: AppTheme.lightColor,
          ),
        ),
        Row(
          children: [
            Image.asset(
              height: 30,
              width: 30,
              fit: BoxFit.fill,
              iconName,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: textTheme.titleSmall,
            )
          ],
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppTheme.lightColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  choice,
                  style: textTheme.titleMedium!
                      .copyWith(color: AppTheme.lightColor),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: AppTheme.lightColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
