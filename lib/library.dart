import 'package:flutter/material.dart';
import 'package:sp/playlist.dart';
import 'package:firebase_database/firebase_database.dart';
import 'playlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LibPage(),
    );
  }
}

class LibPage extends StatefulWidget {
  @override
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {
  int index = 0;
  Widget build(BuildContext) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: 30),
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              child: Row(
                children: <Widget>[
                  Text(
                    "Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Text(
                    "Podcasts",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.black,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.green[500],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.5,
                  // indicator: UnderlineTabIndicator(
                  //   insets: EdgeInsets.symmetric(horizontal: 14),
                  // ),
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Playlists",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Artists",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Albums",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Playlist(),
              ),
              Container(
                child: ArtitstsPage(),
              ),
              Container(
                child: Albums(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class details {
  String asset;
  String name;
  details({this.asset, this.name});
}

final List<String> bootommenu = [];

final List<details> artistpage = [
  // details(name: "Alan Walker", asset: 'assets/alanwalker.jpg'),
  // details(name: "Avicii", asset: 'assets/avicii.jpg'),
  // details(name: "Karsh Kale", asset: 'assets/karshkale.jpg'),
  // details(name: "Greta Van", asset: 'assets/gretavan.jpg'),
  details(name: "Add Artists", asset: 'assets/add.jpg'),
];

final List<details> artists = [
  details(asset: 'assets/badshah.jpg', name: "Badshah"),
  details(asset: 'assets/rihanna.jpg', name: "Rihanna"),
  details(asset: 'assets/beyonce.jpg', name: "Beyonce"),
  details(asset: 'assets/royalblood.jpg', name: "Royal Blood"),
  details(asset: 'assets/gretavan.jpg', name: "Greta Van"),
  details(asset: 'assets/karshkale.jpg', name: "Karsh Kale"),
  details(asset: 'assets/theweekend.jpg', name: "The Weekend"),
  details(asset: 'assets/avicii.jpg', name: "Avicii"),
  details(asset: 'assets/taylorswift.jpg', name: "Taylor Swift"),
  details(asset: 'assets/alanwalker.jpg', name: "Alan Walker"),
  details(asset: 'assets/martingarix.jpg', name: "Martin Garix"),
  details(asset: 'assets/divine.jpg', name: "Divine"),
  details(asset: 'assets/liampayne.jpg', name: "Lian Payne"),
  details(asset: 'assets/justin.jpg', name: "Justin Beiber"),
  details(asset: 'assets/papon.jpg', name: "Papon"),
  details(asset: 'assets/ariana.jpg', name: "Ariana"),
  details(asset: 'assets/2.png', name: "1"),
  details(asset: 'assets/3.png', name: "1"),
  details(asset: 'assets/4.png', name: "1"),
  details(asset: 'assets/5.png', name: "1"),
  details(asset: 'assets/6.png', name: "1"),
];

class Artists extends StatefulWidget {
  ValueSetter<details> _valueSetter;
  Artists(this._valueSetter);

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Container(
            child: GridView.builder(
              itemCount: artists.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: IconButton(
                    onPressed: () {
                      if (!artistpage.contains(artists[index])) {
                        widget._valueSetter(artists[index]);
                        SnackBar mysnackbar = SnackBar(
                          backgroundColor: Colors.black,
                          content: Container(
                            height: 20,
                            child: Center(
                              child: Text(
                                artists[index].name + "  added",
                                style: TextStyle(
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SpotifyFont',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                        Scaffold.of(context).showSnackBar(mysnackbar);
                      } else {
                        SnackBar mysnackbar = SnackBar(
                          backgroundColor: Colors.black,
                          content: Container(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Artist already added",
                                style: TextStyle(
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SpotifyFont',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                        Scaffold.of(context).showSnackBar(mysnackbar);
                      }
                    },
                    icon: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(artists[index].asset),
                            minRadius: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text(
                            artists[index].name,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ArtitstsPage extends StatefulWidget {
  @override
  _ArtitstsPageState createState() => _ArtitstsPageState();
}

class _ArtitstsPageState extends State<ArtitstsPage> {
  Route _createRoute(index) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Artists((selected) {
              setState(() {
                // cart.add(selected);
                artistpage.insert(artistpage.length - 1, selected);
              });
            }),
        settings: RouteSettings(
          arguments: index,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
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

  void buttonpress(index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          child: _bottomnavigatiomenu(index),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
            ),
          ),
        );
      },
    );
  }

  Container _bottomnavigatiomenu(index) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: Image(
              image: AssetImage(
                artistpage[index].asset,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              artistpage[index].name,
              style: TextStyle(
                fontFamily: 'SpotifyFont',
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.people_alt_outlined,
              color: Colors.green[500],
            ),
            title: Text(
              "Following",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SpotifyFont',
                fontSize: 16.5,
              ),
            ),
            onTap: () {
              _selectitem("Following", index);
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.remove_circle_outline,
            ),
            title: Text(
              "Dont't play this artist",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SpotifyFont',
                fontSize: 16.5,
              ),
            ),
            onTap: () {
              _selectitem("Don't play this artist", index);
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              "View Artist",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SpotifyFont',
                fontSize: 16.5,
              ),
            ),
            onTap: () {
              _selectitem("View Artist", index);
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.share,
            ),
            title: Text(
              "Share",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SpotifyFont',
                fontSize: 16.5,
              ),
            ),
            onTap: () {
              _selectitem("Share", index);
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.phone_android,
            ),
            title: Text(
              "Add to Home Screen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SpotifyFont',
                fontSize: 16.5,
              ),
            ),
            onTap: () {
              _selectitem("Add to Home Screen", index);
            },
          ),
        ],
      ),
    );
  }

  void _selectitem(String name, int indexing) {
    if (name == "Following" || name == "Don't play this artist") {
      // Navigator.of(context).push(_createRoute2());
      setState(() {
        artistpage.removeAt(indexing);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 15, 0, 0),
        child: GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 11),
          ),
          itemCount: artistpage.length,
          itemBuilder: (BuildContext context, int index) {
            return IconButton(
              onPressed: () {
                if (artistpage[index].name == "Add Artists") {
                  Navigator.of(context).push(_createRoute(index));
                } else {
                  buttonpress(index);
                }
              },
              icon: Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(artistpage[index].asset),
                      minRadius: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                    ),
                    Text(
                      artistpage[index].name,
                      style: TextStyle(
                        fontFamily: 'SpotifyFont',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        // child: FutureBuilder(
        //   future: dbref6.once(),
        //   builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        //     if (snapshot.hasData) {
        //       lists.clear();
        //       Map<dynamic, dynamic> values = snapshot.data.value;
        //       values.forEach(
        //         (key, values) {
        //           lists.add(values);
        //         },
        //       );
        //       return new ListView.builder(
        //         shrinkWrap: true,
        //         itemCount: lists.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Card(
        //             color: Colors.transparent,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 Text("Songname: " + lists[index]["songname"]),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),
        child: Center(
          child: Text(
            "Your albums will appear here",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SpotifyFont',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

List<dynamic> lists = [];

List<dynamic> printdata = [];
