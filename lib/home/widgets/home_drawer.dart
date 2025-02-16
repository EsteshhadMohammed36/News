import 'package:flutter/material.dart';
import 'package:news/home/widgets/drawer_item.dart';
import 'package:news/utils/app_theme.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({required this.goToHome});

  void Function() goToHome;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: screenSize.width * 0.65,
          height: screenSize.width * 0.35,
          decoration: BoxDecoration(color: AppTheme.lightColor),
          child: Text(
            "News App",
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(16),
          width: screenSize.width * 0.65,
          color: AppTheme.darkColor,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  widget.goToHome();
                },
                child: Row(
                  children: [
                    Icon(
                      size: 40,
                      Icons.home_outlined,
                      color: AppTheme.lightColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Go To Home",
                      style: textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              DrawerItem(
                iconName: "assets/images/theme_icon.png",
                title: "Theme",
                choice: "Dark",
              ),
              DrawerItem(
                iconName: "assets/images/lang_icon.png",
                title: "Language",
                choice: "English",
              )
            ],
          ),
        ))
      ],
    );
  }
}
