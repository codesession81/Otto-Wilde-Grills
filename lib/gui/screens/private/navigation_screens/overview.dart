import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:otto_wilde_recipies/data/lists/favorities.dart';
import 'package:otto_wilde_recipies/data/lists/grill_parties.dart';
import 'package:otto_wilde_recipies/data/lists/overview_header.dart';
import 'package:otto_wilde_recipies/gui/screens/private/show_all/show_all_favorities.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  showRecipe({String? title, String? category}){
    showDialog(
        context:context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text("Rezept $title aus der Kategorie $category ausgewählt"),
            actions: [
              TextButton(
                child: const Text("schliessen"),
                onPressed: ()=>Navigator.of(context).pop()
                ,
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: OverviewHeader.getOverviewHeaderList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(OverviewHeader.getOverviewHeaderList()[index].categorie,style:const TextStyle(color: Colors.grey),),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(OverviewHeader.getOverviewHeaderList()[index].imageUrl,height: 150),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: const <Widget>[
                Text("GRILL CONNECTION",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
              ],
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                //TODO Wrong background color
                color: Colors.black45,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                    child: Column(
                      children: <Widget>[
                       const Text("NEW TO PLATFORM?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                       const SizedBox(height: 20),
                       const Text("Connect your Grill to unlock the power of your Otto Grill",style: TextStyle(color: Colors.grey)),
                       const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 3),
                            child: Text("START TO GRILL SMART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("FAVORITES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowAllFavoritRecipe(favoritRecipeList: Favorities.getFavoritiRecipeList())));
                  },
                  child: Row(
                    children: const <Widget> [
                      Text("View all",style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: Favorities.getFavoritiRecipeList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      showRecipe(title: Favorities.getFavoritiRecipeList()[index].title,category: Favorities.getFavoritiRecipeList()[index].category);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: <Widget>[
                                Image.network(Favorities.getFavoritiRecipeList()[index].imgUrl,height: 150),
                                const Positioned(
                                  right: 0,
                                    child: Icon(Icons.favorite,color: Colors.grey,size: 30,)
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            const Icon(Icons.watch_later_outlined,color: Colors.grey,size: 15),
                            const SizedBox(width: 5),
                            Text(Favorities.getFavoritiRecipeList()[index].time,style:const TextStyle(color: Colors.grey),),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Favorities.getFavoritiRecipeList()[index].title.length > 14 ? Text(Favorities.getFavoritiRecipeList()[index].title.substring(0, 14)+'...',style: const TextStyle(color: Colors.grey),):Text(Favorities.getFavoritiRecipeList()[index].title,style:const TextStyle(color: Colors.grey)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: double.parse(Favorities.getFavoritiRecipeList()[index].rating),
                              itemBuilder: (context,_)=> const Icon(Icons.star,color: Colors.yellow,),
                              onRatingUpdate: (rating){},
                            ),
                            Text("(${Favorities.getFavoritiRecipeList()[index].people})",style:const TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("GRILLPARTY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                TextButton(
                  onPressed: (){},
                  child: Row(
                    children: const <Widget> [
                      Text("View all",style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 230,
              child: ListView.builder(
                itemCount: GrillParty.getGrillPartyList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: ()=> showRecipe(title: GrillParty.getGrillPartyList()[index].title,category: GrillParty.getGrillPartyList()[index].category),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: <Widget>[
                                Image.network(GrillParty.getGrillPartyList()[index].imgUrl,height: 150),
                                const Positioned(
                                    right: 0,
                                    child: Icon(Icons.favorite,color: Colors.grey,size: 30,)
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            const Icon(Icons.watch_later_outlined,color: Colors.grey,size: 15),
                            const SizedBox(width: 5),
                            Text(GrillParty.getGrillPartyList()[index].time,style:const TextStyle(color: Colors.grey),),
                          ],
                        ),
                        const SizedBox(height: 5),
                        GrillParty.getGrillPartyList()[index].title.length > 14 ? Text(GrillParty.getGrillPartyList()[index].title.substring(0, 14)+'...',style: const TextStyle(color: Colors.grey),):Text(GrillParty.getGrillPartyList()[index].title,style:const TextStyle(color: Colors.grey)),
                        Row(
                          children: <Widget>[
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: double.parse(GrillParty.getGrillPartyList()[index].rating),
                              itemBuilder: (context,_)=> const Icon(Icons.star,color: Colors.yellow,),
                              onRatingUpdate: (rating){},
                            ),
                            Text("(${GrillParty.getGrillPartyList()[index].people})",style:const TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
