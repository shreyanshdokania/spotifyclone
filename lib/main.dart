import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_database/firebase_database.dart';

import 'mainpage.dart';
import 'search.dart';
import 'library.dart';
import 'premium.dart';
import 'playlist.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          padding: const EdgeInsets.only(top: 260.0),
          child: new SplashScreen(
            seconds: 2,
            navigateAfterSeconds: HomePage(),
            image: Image.asset(
              'assets/spotify_logo.png',
              height: 150.0,
              width: 150.0,
            ),
            backgroundColor: Colors.black,
            photoSize: 100.0,
            loaderColor: Colors.black,
          ),
        ),
        theme: ThemeData.dark(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchpnames();
  }

  void fetchpnames() {
    dbref.once().then((DataSnapshot printtt) {
      Map<dynamic, dynamic> values = printtt.value;
      values.forEach((key, values) {
        setState(() {
          pnames.add(values["playlistname"]);
        });
      });
    });
    setState(() {
      pnames2 = pnames.toSet().toList();
      for (int c = 0; c < corr.length; c++) {
        pnames2.remove(corr[c]);
      }
    });
  }

  int index = 0;
  Widget build(BuildContext) {
    return Scaffold(
      body: show(index),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            onTap: ((int x) {
              setState(() {
                index = x;
                show(index);
              });
            }),
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                title: Text('Your Library'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.spotify),
                title: Text('Premium'),
              ),
            ]),
      ),
    );
  }
}

Widget show(int index) {
  switch (index) {
    case 0:
      return MainPage();
      break;
    case 1:
      return Search();
      break;
    case 2:
      return Library();
      break;
    case 3:
      return Premium();
      break;
  }
}
