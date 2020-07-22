import 'package:flutter/material.dart';
import 'package:flutterapp/ui/home.dart';
import 'package:flutterapp/ui/helloyou.dart';

void main() {
  runApp(new MaterialApp(
    title: "simple Layout",
    theme: ThemeData(
        primarySwatch: Colors.blue,
      //visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    //home: Home(),
    home: FuelForm(),
  ));

}
