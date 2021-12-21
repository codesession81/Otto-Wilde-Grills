import 'package:otto_wilde_recipies/data/models/recipe.dart';

class Favorities{

  static List<Recipe> getFavoritiRecipeList(){
    List<Recipe> favoritiRecipeList =[
      Recipe(category: "Fisch & Meeresfrüchte", title: "TERIYAKI LACHS MIT GRÜNEM GEMÜSE", time: "00:12", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Lachs_1000_750x.png?v=1625828114", rating: "3.4",people: "2"),
      Recipe(category: "Dessert", title: "BRATAPFEL", time: "00:04", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Bratapfel-08633_1000x750_Final_750x.jpg?v=1637308739", rating: "4.5",people: "4"),
      Recipe(category: "Beilagen", title: "WINTERLICHE KARTOFFELN", time: "00:05", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/geroestete-Kartoffeln-08572_600x450_Final_750x.jpg?v=1636561644", rating: "3.1",people: "4"),
      Recipe(category: "Vorspeise", title: "BIRNE MIT ZIEGENKÄSE", time: "00:03", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Birne-und-Ziegenkaese-08533_1000x750_Final_750x.jpg?v=1637309182", rating: "4.3",people: "4"),
      Recipe(category: "Fleisch", title: "FLAMMKUCHEN", time: "00:01", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Flammkuchen_1_750x.png?v=1631621625", rating: "4.8",people: "10")
    ];
    return favoritiRecipeList;
  }
}