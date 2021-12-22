import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otto_wilde_recipies/data/models/recipe.dart';
import 'package:otto_wilde_recipies/data/repository/grill_parties.dart';

part 'grill_party_event.dart';
part 'grill_party_state.dart';

class GrillPartyBloc extends Bloc<GrillPartyEvent, GrillPartyState> {
  GrillPartyRepository grillPartyRepository;

  GrillPartyBloc({required this.grillPartyRepository}) : super(GrillPartyInitial());

  GrillPartyState get initialState => GrillPartyInitial();


  @override
  Stream<GrillPartyState> mapEventToState(GrillPartyEvent event)async*{
    if(event is FetchGrillPartyEvent){
      yield GrillPartyLoadingState();
      try{
        List<Recipe> recipeList = grillPartyRepository.getGrillPartyList();
        yield GrillPartyLoadedState(recipeList: recipeList);
      }catch(e){
        yield GrillPartyErrorState(message: e.toString());
      }
    }
  }
}
