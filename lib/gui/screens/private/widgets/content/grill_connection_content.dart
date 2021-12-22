import 'package:flutter/material.dart';

class GrillConnectionContent extends StatelessWidget {
  const GrillConnectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
            child: Column(
              children: <Widget>[
                const Text("NEW TO PLATFORM?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                const SizedBox(height: 20),
                const Text("Connect your Grill to unlock the power of your Otto Grill",style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
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
    );
  }
}
