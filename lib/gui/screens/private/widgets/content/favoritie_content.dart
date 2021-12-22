import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:otto_wilde_recipies/data/lists/favorities.dart';
import 'package:otto_wilde_recipies/gui/dialogs/show_recipe_dialog.dart';

class FavoritiesContent extends StatelessWidget {
  const FavoritiesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: Favorities.getFavoritiRecipeList().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              ShowRecipe.dialog(Favorities.getFavoritiRecipeList()[index].title,Favorities.getFavoritiRecipeList()[index].category,context);
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
    );
  }
}
