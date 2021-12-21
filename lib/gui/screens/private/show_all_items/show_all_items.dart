import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:otto_wilde_recipies/data/lists/favorities.dart';
import 'package:otto_wilde_recipies/data/models/recipe.dart';

class ShowAllItems extends StatefulWidget {
  final List<Recipe>? recipeList;
  final String title;
  const ShowAllItems({required this.recipeList,required this.title});

  @override
  _ShowAllItemsState createState() => _ShowAllItemsState();
}

class _ShowAllItemsState extends State<ShowAllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 120),
        itemCount: widget.recipeList!.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.network(widget.recipeList![index].imgUrl,fit: BoxFit.fill),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
          );
        })
    );
  }
}
