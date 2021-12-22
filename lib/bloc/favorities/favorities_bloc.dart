import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otto_wilde_recipies/data/models/recipe.dart';
import 'package:otto_wilde_recipies/data/repository/favorities.dart';

part 'favorities_event.dart';
part 'favorities_state.dart';

class FavoritiesBloc extends Bloc<FavoritiesEvent, FavoritiesState> {
  FavoriteRepository favoriteRepository;

  FavoritiesBloc({required this.favoriteRepository}) : super(FavoritiesInitial());

  FavoritiesState get initialState => FavoritiesInitial();


  @override
  Stream<FavoritiesState> mapEventToState(FavoritiesEvent event)async*{
    if(event is FetchFavoritesEvent){
      yield FavoritiesLoadingState();
      try{
        List<Recipe> recipeList = favoriteRepository.getFavoritiRecipeList();
        yield FavoritiesLoadedState(recipeList: recipeList);
      }catch(e){
        yield FavoritiesErrorState(message: e.toString());
      }
    }
  }
}
