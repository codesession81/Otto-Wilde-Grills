import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otto_wilde_recipies/bloc/favorities_bloc.dart';
import 'package:otto_wilde_recipies/data/repository/favorities.dart';
import 'package:otto_wilde_recipies/gui/screens/private/show_all_items/show_all_items.dart';

class FavoritiesHeader extends StatefulWidget {
  const FavoritiesHeader({Key? key}) : super(key: key);

  @override
  State<FavoritiesHeader> createState() => _FavoritiesHeaderState();
}

class _FavoritiesHeaderState extends State<FavoritiesHeader> {
  FavoritiesBloc? favoritiesBloc;

  @override
  void initState() {
    favoritiesBloc = BlocProvider.of<FavoritiesBloc>(context);
    favoritiesBloc?.add(FetchFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritiesBloc, FavoritiesState>(
      builder: (context, state) {
        if (state is FavoritiesInitial) {
          return const CircularProgressIndicator();
        } else if (state is FavoritiesLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is FavoritiesLoadedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("FAVORITES",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowAllItems(
                                recipeList: state.recipeList,
                                title: 'FAVORITIES',
                              )));
                },
                child: Row(
                  children: const <Widget>[
                    Text("View all", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 15),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
