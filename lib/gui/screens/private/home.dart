import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otto_wilde_recipies/bloc/Favorities/favorities_bloc.dart';
import 'package:otto_wilde_recipies/bloc/grillparty/grill_party_bloc.dart';
import 'package:otto_wilde_recipies/data/repository/favorities.dart';
import 'package:otto_wilde_recipies/data/repository/grill_parties.dart';
import 'package:otto_wilde_recipies/gui/screens/private/navigation_screens/overview.dart';
import 'package:otto_wilde_recipies/gui/screens/private/navigation_screens/recipes.dart';
import 'package:otto_wilde_recipies/gui/screens/private/navigation_screens/settings.dart';
import 'package:otto_wilde_recipies/gui/screens/private/navigation_screens/shopping_list.dart';
import 'package:otto_wilde_recipies/gui/screens/private/navigation_screens/status.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int pageIndex =0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
    );
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex){
    pageController.jumpToPage(
      pageIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=> FavoritiesBloc(favoriteRepository: Favorities())
        ),
        BlocProvider(
            create: (context)=> GrillPartyBloc(grillPartyRepository: GrillParty())
        )
      ],
      child: Scaffold(
          backgroundColor: Colors.black,
          body: PageView(
            children:const <Widget> [
              Overview(),
              Recipes(),
              Status(),
              ShoppingList(),
              Settings(),
            ],
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: pageIndex,
            backgroundColor: Colors.black,
            onTap: onTap,
            activeColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined),label: "Recipes"),
              BottomNavigationBarItem(icon: Icon(Icons.whatshot),label: "Status"),
              BottomNavigationBarItem(icon: Icon(Icons.list),label: "Shopping List"),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Preferences"),
            ],
          ),
        ),
    );
  }
}
