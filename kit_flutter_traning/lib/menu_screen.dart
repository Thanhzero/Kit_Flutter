import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kit_flutter_traning/Common/router_list.dart';

class MenuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.pushNamed(context, RouteList.contacts),
            child: Text("Contacts App"),
          ),
        ],
      ),
    );
  }

}