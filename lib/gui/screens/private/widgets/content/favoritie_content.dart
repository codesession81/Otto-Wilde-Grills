import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:otto_wilde_recipies/bloc/favorities_bloc.dart';
import 'package:otto_wilde_recipies/gui/dialogs/show_recipe_dialog.dart';

class FavoritiesContent extends StatefulWidget {
  const FavoritiesContent({Key? key}) : super(key: key);

  @override
  State<FavoritiesContent> createState() => _FavoritiesContentState();
}

class _FavoritiesContentState extends State<FavoritiesContent> {
  FavoritiesBloc? favoritiesBloc;

  @override
  void initState() {
    favoritiesBloc = BlocProvider.of<FavoritiesBloc>(context);
    favoritiesBloc?.add(FetchFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BlocBuilder<FavoritiesBloc, FavoritiesState>(
        builder: (context, state) {
          if(state is FavoritiesInitial){
            return const CircularProgressIndicator();
          }else if(state is FavoritiesLoadingState){
            return const CircularProgressIndicator();
          }else if(state is FavoritiesLoadedState){
             return ListView.builder(
              itemCount: state.recipeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    ShowRecipe.dialog(state.recipeList[index].title,state.recipeList[index].category,context);
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
                              Image.network(state.recipeList[index].imgUrl,height: 150),
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
                          Text(state.recipeList[index].time,style:const TextStyle(color: Colors.grey),),
                        ],
                      ),
                      const SizedBox(height: 5),
                      state.recipeList[index].title.length > 14 ? Text(state.recipeList[index].title.substring(0, 14)+'...',style: const TextStyle(color: Colors.grey),):Text(state.recipeList[index].title,style:const TextStyle(color: Colors.grey)),
                      Row(
                        children: <Widget>[
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: double.parse(state.recipeList[index].rating),
                            itemBuilder: (context,_)=> const Icon(Icons.star,color: Colors.yellow,),
                            onRatingUpdate: (rating){},
                          ),
                          Text("(${state.recipeList[index].people})",style:const TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          }else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
