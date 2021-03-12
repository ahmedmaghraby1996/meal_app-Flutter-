
import 'package:meal_app/modles/switches.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/modles/myprovider.dart';
import 'package:meal_app/widgest/main_drawer.dart';

class Filter_screen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
  return Filter_screen_state();
  }

}
class Filter_screen_state extends State<Filter_screen>{
  Switches fliters=Switches();
  Map<String,bool> filter;
  bool switched1,switched2,switched3,switched4;
  @override
  void didChangeDependencies() {

 fliters=Provider.of<MyProvider>(context,listen: true).switches;

 switched1=fliters.gluten; switched2=fliters.lactos; switched3=fliters.vegeterian; switched4=fliters.vegan  ;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(
  drawer: Main_Drawer(),
  appBar: AppBar(title: Text("Your Filters"),actions: [
    IconButton(
      onPressed:(){
        setState(() {
          filter={"gluten":switched1,"vegan":switched4,"vegeterian":switched3,"lactos":switched2,"check":true};


         Provider.of<MyProvider>(context,listen: false).changefliter(filter);

        });
      } ,
      icon: Icon(Icons.save)
    )
  ],),

  body: ListView(
    children: [
      SizedBox(height: 20,),
      Text("Adjust your meal selection.",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.bold),textAlign:TextAlign.center ,),
          SizedBox(height: 20,),

          SwitchListTile(

           title: Text("Gluten-free"),
            subtitle: Text("only includes gluten free meals"),
            value: switched1,
            activeColor: Colors.amberAccent,

            onChanged: (value){
             setState(() {
               switched1=value;
               print(switched1);

             });
            },
          ),
      SwitchListTile(

        title: Text("Lactos-free"),
        subtitle: Text("only includes Lactos free meals"),
        value: switched2,
        activeColor: Colors.amberAccent,

        onChanged: (value){
          setState(() {
            switched2=value;
            print(switched2);

          });
        },
      ),
      SwitchListTile(

        title: Text("vegeterian"),
        subtitle: Text("only includes vegeterian meals"),
        value: switched3,
        activeColor: Colors.amberAccent,

        onChanged: (value){
          setState(() {
            switched3=value;
            print(switched3);

          });
        },
      ),
      SwitchListTile(

        title: Text("Vegan"),
        subtitle: Text("only includes vegan meals"),
        value: switched4,
        activeColor: Colors.amberAccent,

        onChanged: (value){
          setState(() {
            switched4=value;
            print(switched4);

          });
        },
      ),


    ],
  ),
);
  }

}