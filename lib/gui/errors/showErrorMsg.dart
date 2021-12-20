import 'package:flutter/material.dart';

class ShowErrorMsg extends StatefulWidget {
  const ShowErrorMsg({Key? key}) : super(key: key);

  @override
  State<ShowErrorMsg> createState() => _ShowErrorMsgState();
}

class _ShowErrorMsgState extends State<ShowErrorMsg> {

  _showErrorMsg(String msg,BuildContext context){
    final snackBar = SnackBar(content: Text("Error"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
