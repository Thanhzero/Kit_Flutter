import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_flutter_traning/menu_screen.dart';
import 'package:kit_flutter_traning/route.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MenuApp(),
      onGenerateRoute:router(),
    );}
  }