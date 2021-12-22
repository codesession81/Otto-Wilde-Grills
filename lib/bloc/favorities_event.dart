part of 'favorities_bloc.dart';

abstract class FavoritiesEvent extends Equatable {
  const FavoritiesEvent();
}

class FetchFavoritesEvent extends FavoritiesEvent{
  @override
  List<Object?> get props => [];

}
