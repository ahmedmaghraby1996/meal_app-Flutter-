import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Meal {
  String id, title, imageUrl;
  int duration;
  List<String> ingredients, steps, categories;
  bool isGlutenFree, isVegan, isVegetarian, isLactoseFree;
  Complexity complexity;
  Affordability affordability;

  Meal(
      {@required this.id,
      @required this.title,
      @required this.duration,
      @required this.ingredients,
      @required this.steps,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.affordability,
      @required this.complexity,
      @required this.categories,
      @required this.imageUrl,
      @required this.isVegetarian});
}

enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Challenging, Hard }
