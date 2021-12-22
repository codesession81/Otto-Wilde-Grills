import 'package:flutter/material.dart';

class GrillConnectionHeader extends StatelessWidget {
  const GrillConnectionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text("GRILL CONNECTION",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
      ],
    );
  }
}
