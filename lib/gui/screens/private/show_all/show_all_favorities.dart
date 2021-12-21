import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/data/models/recipe.dart';

class ShowAllFavorities extends StatefulWidget {
  final List<Recipe>? memberList;
  const ShowAllFavorities({required this.memberList});

  @override
  _ShowAllFavoritiesState createState() => _ShowAllFavoritiesState();
}

class _ShowAllFavoritiesState extends State<ShowAllFavorities> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
