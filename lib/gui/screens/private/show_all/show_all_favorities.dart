import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/data/models/recipe.dart';

class ShowAllFavoritRecipe extends StatefulWidget {
  final List<Recipe>? favoritRecipeList;
  const ShowAllFavoritRecipe({required this.favoritRecipeList});

  @override
  _ShowAllFavoritRecipeState createState() => _ShowAllFavoritRecipeState();
}

class _ShowAllFavoritRecipeState extends State<ShowAllFavoritRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text("FAVORITIES"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 15),
        itemCount: widget.favoritRecipeList!.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
            child: const SizedBox(
              height: 400,
            ),
          );
        })
    );
  }
}
