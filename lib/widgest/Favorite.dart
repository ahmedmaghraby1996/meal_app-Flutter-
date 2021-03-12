

import 'package:flutter/material.dart';

class Favorite extends InheritedWidget{
 final List<String> id;


  Favorite({@required this.id});

  @override
  bool updateShouldNotify(Favorite oldWidget) {


  return id !=oldWidget.id;

  }
  static Favorite of (context)=>context.inhertFromWidgetOfExactType(Favorite);

}