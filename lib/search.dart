import 'package:flutter/material.dart';
import 'searchdata.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> _listItem = [
    // 'assets/genre.png',
    'assets/first.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/14.png',
    'assets/15.png',
    'assets/16.png',
    'assets/17.png',
    'assets/18.png',
    'assets/19.png',
    'assets/20.png',
    'assets/21.png',
    'assets/22.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF414345),
              Color(0xFF000000),
            ],
            begin: Alignment.topLeft,
            end: FractionalOffset(0.2, 0.7),
          ),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  // height: 150,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                        ),
                        Text(
                          "  Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'SpotifyFont',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 11),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              height: 50.0,
                              width: 370.0,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                  ),
                                  Text(
                                    'Artists, ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SpotifyFont'),
                                  ),
                                  Text(
                                    'songs or',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SpotifyFont'),
                                  ),
                                  Text(
                                    ' podcasts',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SpotifyFont'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 27,
                  child: Container(
                    padding: const EdgeInsets.only(right: 288),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Browser all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'SpotifyFont',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: GridView.builder(
                      itemCount: _listItem.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 4),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRoute(index));
                              setState(() {
                                passsearchdata = searchdata[index];
                              });
                            },
                            icon: Image.asset(
                              _listItem[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String passsearchdata;
Route _createRoute(index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Searchdata(),
      settings: RouteSettings(
        arguments: index,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
