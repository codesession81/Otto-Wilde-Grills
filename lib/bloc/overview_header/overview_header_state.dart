part of 'overview_header_bloc.dart';

abstract class OverviewHeaderState extends Equatable {
  const OverviewHeaderState();
}

class OverviewHeaderInitial extends OverviewHeaderState {
  @override
  List<Object> get props => [];
}

class OverviewHeaderLoadingState extends OverviewHeaderState{
  @override
  List<Object> get props => [];
}

class OverviewHeaderLoadedState extends OverviewHeaderState{
  List<HeaderWidget> headerWidgetList;
  OverviewHeaderLoadedState({required this.headerWidgetList});

  @override
  List<Object> get props => [headerWidgetList];
}

class OverviewHeaderErrorState extends OverviewHeaderState{
  String message;
  OverviewHeaderErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
