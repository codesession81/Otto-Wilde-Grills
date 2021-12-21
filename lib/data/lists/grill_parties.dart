import 'package:otto_wilde_recipies/data/models/recipe.dart';

class GrillParty{
  static List<Recipe> getGrillPartyList(){
    List<Recipe> grillPartiesList =[
      Recipe(category: "Fisch & Meeresfrüchte", title: "GEGRILLTE FORELLE", time: "00:05", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Regenbogenforelle_1000x750_033a3d6c-0661-4096-ab4d-f33b3d37926b_750x.jpg?v=1619445943", rating: "3",people: "4"),
      Recipe(category: "Fleisch", title: "DÜSSELDORFER SENFROSTBRATEN BURGER", time: "00:08", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Bratenburger_750x.png?v=1631614894", rating: "4",people: "2"),
      Recipe(category: "Beilagen", title: "CRANBERRY SAUCE", time: "00:02", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Leftover-Turkey-Tacos_8810_600x450_4848bdb2-54f9-4ee5-a3be-94a51fce883b_750x.jpg?v=1636558674", rating: "3",people: "4"),
      Recipe(category: "Vorspeise", title: "ZIEGENKÄSE IM SPECKMANTEL MIT FELDSALAT", time: "00:02", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Ziegenkase-im-Speckmantel_750x.jpg?v=1619444393", rating: "4",people: "4"),
      Recipe(category: "Fleisch", title: "MAISHÄHNCHEN MIT SOMMERGEMÜSE", time: "00:14", imgUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Maishahnchen_1000_750x.png?v=1625831284", rating: "4",people: "2")
    ];
    return grillPartiesList;
  }
}