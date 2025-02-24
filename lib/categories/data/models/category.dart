class Category {
  String id;
  String imageName;

  Category({required this.id, required this.imageName});

  static List<Category> categoriesLight = [
    Category(id: "General", imageName: "assets/images/general_dark.png"),
    Category(id: "Business", imageName: "assets/images/business_dark.png"),
    Category(id: "Sports", imageName: "assets/images/sports_dark.png"),
    Category(
        id: "Entertainment", imageName: "assets/images/entertainment_dark.png"),
    Category(id: "Health", imageName: "assets/images/health_dark.png"),
    Category(id: "Science", imageName: "assets/images/science_dark.png"),
    Category(id: "Technology", imageName: "assets/images/technology_dark.png"),
  ];
}
