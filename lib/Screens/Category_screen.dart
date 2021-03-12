import 'package:flutter/material.dart';
import 'package:meal_app/1.2 dummy_data.dart';
import 'package:meal_app/widgest/main_drawer.dart';
import 'Favorite_Screen.dart';
import 'package:provider/provider.dart';

class Category_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Category_screen_State();
  }
}

class Category_screen_State extends State<Category_screen> {
  int currentindext = 0;

  void tabbed(int index) {
    setState(() {
      currentindext = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String,bool> filter = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      drawer: Main_Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        currentIndex: currentindext,
        type: BottomNavigationBarType.shifting,
        onTap: tabbed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Category"),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favorites"),
              backgroundColor: Colors.redAccent)
        ],
      ),
      appBar:currentindext==0? AppBar(
        title: Text("Category"),
      ):AppBar(
    title: Text("Favorites")),
      body: currentindext == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 20,
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 20),
                  itemCount: DUMMY_CATEGORIES.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/meals",
                            arguments: {"id": DUMMY_CATEGORIES[index].id});
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                  colors: [
                                    DUMMY_CATEGORIES[index].color,
                                    DUMMY_CATEGORIES[index]
                                        .color
                                        .withOpacity(.5)
                                  ],
                                  end: Alignment.bottomRight,
                                  begin: Alignment.topLeft)),
                          child: Text(
                            DUMMY_CATEGORIES[index].title,
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      borderRadius: BorderRadius.circular(8),
                    );
                  }),
            )
          : Favorite_Screen(),
    );
  }
}
