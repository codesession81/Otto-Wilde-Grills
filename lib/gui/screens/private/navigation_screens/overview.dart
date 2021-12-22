import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/content/favoritie_content.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/content/grill_connection_content.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/content/grill_party_content.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/header/favorities_header.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/header/grill_connection_header.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/header/grill_party_header.dart';
import 'package:otto_wilde_recipies/gui/screens/private/widgets/header/news_tutorials_products.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NewsTutorialsProducts(),
            GrillConnectionHeader(),
            SizedBox(height: 8),
            GrillConnectionContent(),
            SizedBox(height: 20),
            FavoritiesHeader(),
            FavoritiesContent(),
            SizedBox(height: 25),
            GrillPartyHeader(),
            SizedBox(height: 25),
            GrillPartyContent()
          ],
        ),
      ),
    );
  }
}
