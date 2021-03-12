import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/1.2 dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modles/meal.dart';
import 'package:meal_app/widgest/Favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Details_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return Details_Screen_state();
  }


  }
class Details_Screen_state extends State<Details_Screen>{




SharedPreferences preferences;
List<String> idd= List();
  var c =Colors.white;
Meal  meal=Meal();
bool check=false;
@override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies()async {

  preferences =  await SharedPreferences.getInstance();
idd=preferences.getStringList("id");

    setState(() {
      for(int i=0; i <idd.length;i++){
        if(idd[i]==meal.id)
          c=Colors.red;}
    });



  super.didChangeDependencies();
  }

//   void initState() {
//   WidgetsFlutterBinding.ensureInitialized();
// preferences = SharedPreferences.getInstance() as SharedPreferences;
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {



    Map<String,Object> data=   ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, Object>;
meal = data["data"];
check=data["check"] as bool;

return Scaffold(
    floatingActionButton: check==false ?FloatingActionButton(
      onPressed: ()  async{

idd.add(meal.id);
preferences.setStringList("id", idd);
        setState(() {
          c=Colors.red;

        });

  },
      backgroundColor: Colors.amberAccent,
      child:Icon(Icons.favorite,color: c,) ,
    ):FloatingActionButton(onPressed: (){
      setState(() {
        idd.removeWhere((element) => element==meal.id);
        preferences.setStringList("id", idd);

      });
      Navigator.of(context).pop([meal.id]);
    },child: Icon(Icons.delete),),
    appBar: AppBar(title: Text("Details"),),
    body: SingleChildScrollView(
      child: Column(

        children: [

          Container(child: Image.network(meal.imageUrl, fit: BoxFit.cover,),
            width: double.infinity,
            height: 300,),
          SizedBox(height: 20,),
          Text("Ingderints", style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Container(

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),),
            width: 300,
            height: 300,
            child: ListView.builder(itemCount: meal.ingredients.length,
                itemBuilder: (_, index) =>

                    Card(elevation: 10,
                        child: ListTile(
                          title: Text(meal.ingredients[index]),
                          tileColor: Colors.amberAccent,))
            ),
          ),SizedBox(height: 20,),
          Text("Steps", style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.bold),),SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),),
            width: 300,
            height: 300,
            child: ListView.builder(
                itemCount: meal.steps.length, itemBuilder: (_, index) =>

                Card(elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.red,
                        child: Text("#${(index + 1).toString()}"),),
                      title: Text(meal.steps[index]),
                    ))
            ),
          ),
        ],
      ),
    )
);
  }

}