import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otto_wilde_recipies/data/models/headerWidget.dart';
import 'package:otto_wilde_recipies/data/repository/overview_header.dart';

part 'overview_header_event.dart';
part 'overview_header_state.dart';

class OverviewHeaderBloc extends Bloc<OverviewHeaderEvent, OverviewHeaderState> {
  OverviewHeaderRepository overviewHeaderRepository;

  OverviewHeaderBloc({required this.overviewHeaderRepository}) : super(OverviewHeaderInitial());

  OverviewHeaderState get initialState => OverviewHeaderInitial();


  @override
  Stream<OverviewHeaderState> mapEventToState(OverviewHeaderEvent event)async*{
    if(event is FetchOverviewHeadeEvent){
      yield OverviewHeaderLoadingState();
      try{
        List<HeaderWidget> headerWidgetList = overviewHeaderRepository.getOverviewHeaderList();
        yield OverviewHeaderLoadedState(headerWidgetList: headerWidgetList);
      }catch(e){
        yield OverviewHeaderErrorState(message: e.toString());
      }
    }
  }
}
