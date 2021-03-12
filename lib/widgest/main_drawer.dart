import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/Screens/Category_screen.dart';



class Main_Drawer extends StatefulWidget {
Map<String,bool> filters;
Main_Drawer({this.filters});

  @override
  State<StatefulWidget> createState() {
   return Main_Drawer_State();
  }
}
class Main_Drawer_State extends State<Main_Drawer>{




  @override
  Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       children: [
         Container(
           color: Colors.amberAccent,
           height: 130,
           padding: EdgeInsets.all(20),
           child: Text(
             "Cooking Up",
             style: GoogleFonts.alata(fontSize: 30, color: Colors.redAccent),
           ),
         ),
         SizedBox(
           height: 20,
         ),
         InkWell(
           onTap:(){ Navigator.of(context).pushNamed("/",arguments: widget.filters);print(widget.filters["gluten"]);},
           child: ListTile(
             leading: Icon(
               Icons.restaurant,
               size: 26,
             ),
             title: Text(
               "Meal",
               style: GoogleFonts.acme(fontSize: 24),
             ),
           ),
         ),
         InkWell(
             child: ListTile(
               leading: Icon(
                 Icons.settings,
                 size: 26,
               ),
               title: Text(
                 "Filters",
                 style: GoogleFonts.acme(fontSize: 24),
               ),
               onTap: () => Navigator.pushNamed(context, "/filter"),
             ))
       ],
     ),
   );
  }

}
