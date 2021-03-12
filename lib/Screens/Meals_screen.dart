import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/modles/myprovider.dart';
import 'package:meal_app/modles/switches.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modles/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/1.2 dummy_data.dart';
import 'package:provider/provider.dart';
class Meals_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Meals_Screen_State();
  }
}

class Meals_Screen_State extends State<Meals_Screen> {
  Map<String,String> date=Map();
  List<Meal> meals;
  var filter1 = false, filter2 = false, filter3 = false, filter4 = false;

  Switches filters=Switches();
  @override
  void didChangeDependencies() {
     date=ModalRoute.of(context).settings.arguments;
     meals=List();
     if(!(filters==null)){
       {
         filter1 = filters.gluten;
         filter2 = filters.lactos;
         filter3 = filters.vegeterian;
         filter4 = filters.vegan;

       }}

     meals = DUMMY_MEALS
         .where((element) => (filters.check == null
         ? element.categories.contains(date["id"])
         : (element.categories.contains(date["id"]) &&
         element.isGlutenFree == filter1 &&
         element.isLactoseFree == filter2 &&
         element.isVegetarian == filter3 &&
         element.isVegan == filter4)))
         .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

filters=Provider.of<MyProvider>(context).switches;
int s =Provider.of<MyProvider>(context).s;
print("s is ${s.toString()}");
print("lactos${filters.lactos}");

print(date["id"]);
    
    return buildScaffold(context);


  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Meals"),
    ),
    body: ListView.builder(
      itemBuilder: (_, index) {
        return Container(
          color: Color.fromARGB(1, 250, 253, 250),
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/details",
                    arguments: {"data": meals[index],"check":false}).then((value) {
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
