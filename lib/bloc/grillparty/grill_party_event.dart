part of 'grill_party_bloc.dart';

abstract class GrillPartyEvent extends Equatable {
  const GrillPartyEvent();
}

class FetchGrillPartyEvent extends GrillPartyEvent{
  @override
  List<Object?> get props => [];
}