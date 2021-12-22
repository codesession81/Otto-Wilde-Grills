import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otto_wilde_recipies/bloc/overview_header/overview_header_bloc.dart';
import 'package:otto_wilde_recipies/data/repository/overview_header.dart';

class NewsTutorialsProducts extends StatefulWidget {
  const NewsTutorialsProducts({Key? key}) : super(key: key);

  @override
  State<NewsTutorialsProducts> createState() => _NewsTutorialsProductsState();
}

class _NewsTutorialsProductsState extends State<NewsTutorialsProducts> {
  OverviewHeaderBloc? overviewHeaderBloc;

  @override
  void initState() {
    overviewHeaderBloc = BlocProvider.of<OverviewHeaderBloc>(context);
    overviewHeaderBloc?.add(FetchOverviewHeadeEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewHeaderBloc, OverviewHeaderState>(
  builder: (context, state) {
    if(state is OverviewHeaderInitial){
      return const CircularProgressIndicator();
    }else if(state is OverviewHeaderLoadingState){
      return const CircularProgressIndicator();
    }else if(state is OverviewHeaderLoadedState){
      return SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: state.headerWidgetList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.headerWidgetList[index].categorie,style:const TextStyle(color: Colors.grey),),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(state.headerWidgetList[index].imageUrl,height: 150),
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  },
);
  }
}
