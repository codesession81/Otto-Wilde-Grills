import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<String> navListWidget = ["Tutorials","Products","News","Tutorials","Products","News","Tutorials","Products","News","Tutorials","Products","News"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: navListWidget.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Text(navListWidget[index]),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const <Widget>[
                Text("GRILL CONNECTION",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
              ],
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black12,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Text("NEW TO PLATFORM?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                        SizedBox(height: 20),
                        Text("Connect your Grill to unlock the power of your Otto Grill",style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 3),
                            child: Text("START TO GRILL SMART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("FAVORITES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                TextButton(
                  onPressed: (){},
                  child: Row(
                    children: const <Widget> [
                      Text("View all",style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
