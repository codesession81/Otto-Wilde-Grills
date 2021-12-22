import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/data/lists/grill_parties.dart';
import 'package:otto_wilde_recipies/gui/screens/private/show_all_items/show_all_items.dart';

class GrillPartyHeader extends StatelessWidget {
  const GrillPartyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text("GRILLPARTY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
        TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowAllItems(recipeList: GrillParty.getGrillPartyList(), title: 'GRILL PARTY',)));
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
  }
}
