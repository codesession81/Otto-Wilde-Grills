import 'package:otto_wilde_recipies/data/models/recipe.dart';

class Favorities{

  static List<Recipe> getFavoritiesList(){
    List<Recipe> favoritiesList =[
      Recipe(category: "Fisch & Meeresfrüchte", title: "TERIYAKI LACHS MIT GRÜNEM GEMÜSE", time: "12 min", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Lachs_1000_750x.png?v=1625828114", rating: "3"),
      Recipe(category: "Dessert", title: "BRATAPFEL", time: "4 min", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Bratapfel-08633_1000x750_Final_750x.jpg?v=1637308739", rating: "4"),
      Recipe(category: "Beilagen", title: "WINTERLICHE KARTOFFELN", time: "5 min", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/geroestete-Kartoffeln-08572_600x450_Final_750x.jpg?v=1636561644", rating: "3"),
      Recipe(category: "Vorspeise", title: "BIRNE MIT ZIEGENKÄSE", time: "3 min", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Birne-und-Ziegenkaese-08533_1000x750_Final_750x.jpg?v=1637309182", rating: "4"),
      Recipe(category: "Fleisch", title: "FLAMMKUCHEN", time: "1 min", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Flammkuchen_1_750x.png?v=1631621625", rating: "4")
    ];
    return favoritiesList;
  }
}