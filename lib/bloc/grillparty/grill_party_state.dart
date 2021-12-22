part of 'grill_party_bloc.dart';

abstract class GrillPartyState extends Equatable {
  const GrillPartyState();
}

class GrillPartyInitial extends GrillPartyState {
  @override
  List<Object> get props => [];
}

class GrillPartyLoadingState extends GrillPartyState{
  @override
  List<Object> get props => [];
}

class GrillPartyLoadedState extends GrillPartyState{
  List<Recipe> recipeList;
  GrillPartyLoadedState({required this.recipeList});

  @override
  List<Object> get props => [recipeList];
}

class GrillPartyErrorState extends GrillPartyState{
  String message;
  GrillPartyErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
