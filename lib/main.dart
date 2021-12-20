import 'package:flutter/material.dart';
import 'package:otto_wilde_recipies/gui/screens/authentication/login.dart';

void main() {
  runApp(const MaterialApp(
    home: Launcher(),
  ));
}

class Launcher extends StatelessWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}
