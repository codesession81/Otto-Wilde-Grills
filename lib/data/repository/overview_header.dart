import 'package:otto_wilde_recipies/data/models/headerWidget.dart';

class OverviewHeader{
  static List<HeaderWidget> getOverviewHeaderList(){
    List<HeaderWidget> headerWidgetList =[
      HeaderWidget(categorie: "Tutorials",imageUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/articles/Lammkarree-08591_600x400_Final_750x.jpg?v=1639068255"),
      HeaderWidget(categorie: "Products",imageUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/products/OFB-Portfolio_Frei_OFB-Premium_ausgezogen_Seitlich_600px_3_750x.png?v=1634720923"),
      HeaderWidget(categorie: "News",imageUrl: "https://cdn.shopify.com/s/files/1/0503/8522/3842/products/e8eRVpYg_400x.jpg?v=1634721174"),
    ];
    return headerWidgetList;
  }
}