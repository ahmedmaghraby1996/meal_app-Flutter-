
import 'package:flutter/material.dart';
import 'package:meal_app/modles/switches.dart';

class MyProvider with ChangeNotifier{

Switches switches = Switches(false,false,false,false);
int s =0;


  changefliter( Map <String,bool> fliters){
s++;
switches.gluten=fliters["gluten"];
switches.lactos=fliters["lactos"];
switches.vegan=fliters["vegan"];
switches.vegeterian=fliters["vegeterian"];
notifyListeners();
return switches;



 }

}