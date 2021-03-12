import 'package:shared_preferences/shared_preferences.dart';
import 'package:meal_app/modles/meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'Meals_screen.dart';
import 'package:meal_app/1.2 dummy_data.dart';
import 'package:meal_app/widgest/Favorite.dart';

import 'dart:math';

class Favorite_Screen extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
return Favorite_Screen_State();
  }

  }

class Favorite_Screen_State extends State<Favorite_Screen>{


  SharedPreferences preferences;
  List<String> id=List() ;
  List <Meal> meals=List();

@override
  void didChangeDependencies() async{
  WidgetsFlutterBinding.ensureInitialized();
  super.didChangeDependencies();

 preferences  =  await SharedPreferences.getInstance();
  id=preferences.getStringList("id");
print(id);
  setState(() {
for(int i=0 ; i<id.length;i++){
  for(int j=0 ; j<DUMMY_MEALS.length;j++)
    {
      if(id[i]==DUMMY_MEALS[j].id)
        meals.add(DUMMY_MEALS[j]);
      print("meals ${meals.length}");
    }}
  });


  print(meals);

  }



  @override
  Widget build(BuildContext context) {

return
Scaffold(

    body: ListView.builder(
      itemBuilder: (_, index) {
        return Container(
          color: Color.fromARGB(1, 250, 253, 250),
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/details",
                    arguments: {"data": meals[index],"check":true}).then((value) {
                  setState(() {
                    meals.removeWhere((element) => element.id == value);

                  });
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        child: Image.network(meals[index].imageUrl),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.grey.withOpacity(.5),
                          child: Text(
                            meals[index].title,
                            style: GoogleFonts.sacramento(
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm),
                            Text(meals[index].duration.toString())
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            meals[index].complexity == Complexity.Simple
                                ? Text("Simple")
                                : meals[index].complexity ==
                                Complexity.Challenging
                                ? Text("Challenging")
                                : Text("hard")
                          ],
                        ),
                        Row(children: [
                          Icon(Icons.monetization_on_outlined),
                          meals[index].affordability ==
                              Affordability.Affordable
                              ? Text("Affordable")
                              : meals[index].affordability ==
                              Affordability.Pricey
                              ? Text("Pricy")
                              : Text("Luxurious")
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: meals.length,
    ),
  );

  }

}
