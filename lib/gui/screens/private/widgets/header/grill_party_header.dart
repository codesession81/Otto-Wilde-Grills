import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otto_wilde_recipies/bloc/grillparty/grill_party_bloc.dart';
import 'package:otto_wilde_recipies/data/repository/grill_parties.dart';
import 'package:otto_wilde_recipies/gui/screens/private/show_all_items/show_all_items.dart';

class GrillPartyHeader extends StatefulWidget {
  const GrillPartyHeader({Key? key}) : super(key: key);

  @override
  State<GrillPartyHeader> createState() => _GrillPartyHeaderState();
}

class _GrillPartyHeaderState extends State<GrillPartyHeader> {
  GrillPartyBloc? grillPartyBloc;

  @override
  void initState() {
    grillPartyBloc = BlocProvider.of<GrillPartyBloc>(context);
    grillPartyBloc?.add(FetchGrillPartyEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrillPartyBloc, GrillPartyState>(
  builder: (context, state) {
    if (state is GrillPartyInitial) {
      return const CircularProgressIndicator();
    } else if (state is GrillPartyLoadingState) {
      return const CircularProgressIndicator();
    } else if (state is GrillPartyLoadedState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("GRILLPARTY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowAllItems(recipeList: state.recipeList, title: 'GRILL PARTY',)));
            },
            child: Row(
              children: const <Widget> [
                Text("View all",style: TextStyle(color: Colors.grey)),
                SizedBox(width: 15),
                Icon(Icons.arrow_forward_ios,color: Colors.grey,),
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
