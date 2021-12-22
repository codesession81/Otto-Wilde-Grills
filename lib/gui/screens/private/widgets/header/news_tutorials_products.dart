import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/data/repository/overview_header.dart';

class NewsTutorialsProducts extends StatelessWidget {
  const NewsTutorialsProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: OverviewHeader.getOverviewHeaderList().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(OverviewHeader.getOverviewHeaderList()[index].categorie,style:const TextStyle(color: Colors.grey),),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(OverviewHeader.getOverviewHeaderList()[index].imageUrl,height: 150),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
