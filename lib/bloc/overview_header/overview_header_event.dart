part of 'overview_header_bloc.dart';

abstract class OverviewHeaderEvent extends Equatable {
  const OverviewHeaderEvent();
}

class FetchOverviewHeadeEvent extends OverviewHeaderEvent{
  @override
  List<Object?> get props => [];
}