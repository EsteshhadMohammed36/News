class Category {
  String id;
  String name;
  String imageName;

  Category({required this.id, required this.name, required this.imageName});

  static List<Category> categoriesLight = [
    Category(
        id: '1', name: "General", imageName: "assets/images/general_dark.png"),
    Category(
        id: '2',
        name: "Business",
        imageName: "assets/images/business_dark.png"),
    Category(
        id: '3', name: "Sports", imageName: "assets/images/sports_dark.png"),
    Category(
        id: '4',
        name: "Entertainment",
        imageName: "assets/images/entertainment_dark.png"),
    Category(
        id: '5', name: "Health", imageName: "assets/images/health_dark.png"),
    Category(
        id: '6', name: "Science", imageName: "assets/images/science_dark.png"),
    Category(
        id: '7',
        name: "Technology",
        imageName: "assets/images/technology_dark.png"),
  ];
}
