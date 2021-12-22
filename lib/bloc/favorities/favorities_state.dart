part of 'favorities_bloc.dart';

abstract class FavoritiesState extends Equatable {
  const FavoritiesState();
}

class FavoritiesInitial extends FavoritiesState {
  @override
  List<Object> get props => [];
}

class FavoritiesLoadingState extends FavoritiesState{
  @override
  List<Object> get props => [];
}

class FavoritiesLoadedState extends FavoritiesState{
  List<Recipe> recipeList;
  FavoritiesLoadedState({required this.recipeList});

  @override
  List<Object> get props => [recipeList];
}

class FavoritiesErrorState extends FavoritiesState{
  String message;
  FavoritiesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
