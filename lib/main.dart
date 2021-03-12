import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/Screens/Category_screen.dart';
import 'package:meal_app/modles/myprovider.dart';
import 'modles/category.dart';
import 'Screens/Meals_screen.dart';
import 'Screens/Details_Screen.dart';
import'Screens/filter_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child:  MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

        "/meals": (contex) => Meals_Screen(),
        "/details": (context) => Details_Screen(),
        "/filter": (context) => Filter_screen()
      },
      home:  Category_screen(),
      theme: ThemeData(

          textTheme: TextTheme(
              bodyText1: GoogleFonts.abhayaLibre(
        fontSize: 25,
      )))
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Category> list = [Category(id: "", title: "null", color: Colors.black)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Text("hi"),
    );
  }
}
