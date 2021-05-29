import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';

final dbref = FirebaseDatabase.instance.reference().child("playlistdata");

List<String> pnames = [];
List<String> pnames2 = [];

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  void initState() {
    super.initState();
    fetchpnames();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Playlistname((select) {
        setState(() {
          addsongs2.add(select);
        });
      }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Myplaylist((selection) {
        setState(() {
          pnames2.remove(selection);
          for (int c = 0; c < corr.length; c++) {
            pnames2.remove(corr[c]);
          }
        });
      }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void fetchpnames() {
    // pnames.clear();
    dbref.once().then((DataSnapshot printtt) {
      Map<dynamic, dynamic> values = printtt.value;
      values.forEach((key, values) {
        setState(() {
          pnames.add(values["playlistname"]);
          // print(pnames);
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

  @override
  Widget build(BuildContext context) {
    if (pnames2.length == 0) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.only(top: 200),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "Create your first playlist",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpotifyFont',
                    fontSize: 23,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Center(
                child: Text(
                  "It's easy,we'll help you.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              Center(
                child: ButtonTheme(
                  height: 50,
                  minWidth: 230,
                  buttonColor: Colors.white,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                      // fetchpnames();
                    },
                    child: Text(
                      "CREATE PLAYLIST",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: <Widget>[
              IconButton(
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                icon: Container(
                  padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 65,
                        color: Colors.grey[850],
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Create Playlist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              for (int index = 0; index < pnames2.length; index++)
                IconButton(
                  iconSize: 45,
                  onPressed: () {
                    Navigator.of(context).push(_createRoute2());
                    pname2 = pnames2[index];
                    for (int c = 0; c < corr.length; c++) {
                      pnames2.remove(corr[c]);
                    }
                  },
                  icon: Container(
                    padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 65,
                          color: Colors.transparent,
                          child: Icon(
                            Icons.music_note_rounded,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            pnames2[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }
  }
}

class Playlistname extends StatefulWidget {
  ValueSetter<songplaylist> _valueSetter3;
  Playlistname(this._valueSetter3);
  @override
  _PlaylistnameState createState() => _PlaylistnameState();
}

class _PlaylistnameState extends State<Playlistname> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Playlistsong((selected) {
        setState(() {
          addsongs.add(selected);
          widget._valueSetter3(selected);
          addsongs.remove(selected);
        });
      }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  final TextEditingController text1 = new TextEditingController();
  String playlist = "";
  String secbutton = "SKIP";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Container(
        padding: EdgeInsets.only(top: 250),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: FractionalOffset(0.0, 0.8),
            colors: [
              Colors.grey,
              Color(0xFF000000),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Give your playlist a name",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SpotifyFont',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      cursorHeight: 56,
                      cursorColor: Colors.grey,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      controller: text1,
                      onChanged: (String str) {
                        if (str.length != 0) {
                          setState(() {
                            secbutton = "CREATE";
                            pname = str;
                          });
                        } else if (str.length == 0) {
                          setState(() {
                            secbutton = "SKIP";
                            pname = "New Playlist";
                          });
                        }
                      },
                      onSubmitted: (String str) {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(120, 65, 100, 0),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              SystemNavigator.pop();
                            }
                          },
                          color: Colors.transparent,
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          color: Colors.transparent,
                          child: Text(
                            secbutton,
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.green[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Playlistsong extends StatefulWidget {
  ValueSetter<songplaylist> _valueSetter2;
  Playlistsong(this._valueSetter2);
  @override
  _PlaylistsongState createState() => _PlaylistsongState();
}

class _PlaylistsongState extends State<Playlistsong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 85),
          child: Row(
            children: <Widget>[
              Text(
                "Add songs",
              ),
              Padding(
                padding: EdgeInsets.only(left: 94),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.grey[700],
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    cursorHeight: 36,
                    cursorColor: Colors.grey[700],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 625,
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 0.95,
                    initialPage: 0,
                  ),
                  itemBuilder: (BuildContext context, int index, int a) {
                    if (index == 0) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                          color: Colors.grey[900],
                        ),
                        width: 370,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Suggested",
                                          style: TextStyle(
                                            fontFamily: 'SpotifyFont',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            letterSpacing: 0.8,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                        ),
                                        for (int i = 0;
                                            i < _listItem3.length;
                                            i++)
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.music_note,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  _listItem3[i].songnames,
                                                ),
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                  child: Icon(
                                                    Icons.add,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (!addsongs2.contains(
                                                      _listItem3[i])) {
                                                    widget._valueSetter2(
                                                        _listItem3[i]);
                                                    dbref.push().set({
                                                      "songname": _listItem3[i]
                                                          .songnames,
                                                      "playlistname": pname,
                                                    });
                                                    setState(() {
                                                      _listItem3.removeAt(i);
                                                      pnames.add(pname);
                                                    });
                                                    dbref.once().then(
                                                        (DataSnapshot printtt) {
                                                      Map<dynamic, dynamic>
                                                          values =
                                                          printtt.value;
                                                      values.forEach(
                                                          (key, values) {
                                                        setState(() {
                                                          pnames.add(values[
                                                              "playlistname"]);
                                                        });
                                                      });
                                                    });
                                                    setState(() {
                                                      pnames2 = pnames
                                                          .toSet()
                                                          .toList();
                                                      pnames2
                                                          .remove(correction);
                                                      for (int c = 0;
                                                          c < corr.length;
                                                          c++) {
                                                        pnames2.remove(corr[c]);
                                                      }
                                                    });
                                                    print(pnames2);
                                                  }
                                                },
                                              )
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (index == 1) {
                      return Container(
                        width: 350,
                        color: Colors.grey[900],
                        child: FutureBuilder(
                          future: dbref7.once(),
                          builder:
                              (context, AsyncSnapshot<DataSnapshot> snapshot) {
                            if (snapshot.hasData) {
                              fetchingsongs.clear();
                              Map<dynamic, dynamic> values =
                                  snapshot.data.value;
                              values.forEach(
                                (key, values) {
                                  fetchingsongs.add(values);
                                },
                              );
                              return new ListView.builder(
                                shrinkWrap: true,
                                itemCount: fetchingsongs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(fetchingsongs[index]["songname"]),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      );
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final dbref7 = FirebaseDatabase.instance.reference().child("songs");
List<dynamic> fetchingsongs = [];

String pname = "New Playlist";
List<songplaylist> _listItem2 = [
  songplaylist(songnames: 'Haan Tu Hain', playlistname: pname),
  songplaylist(songnames: 'Zara Sa', playlistname: pname),
  songplaylist(songnames: 'I Like Me Better', playlistname: pname),
  songplaylist(songnames: 'Kyon', playlistname: pname),
  songplaylist(songnames: 'Cant Take My Eyes Off You', playlistname: pname),
  songplaylist(songnames: 'Antisocial With Travis Scott', playlistname: pname),
  songplaylist(songnames: 'Somebody That I Used To Know', playlistname: pname),
  songplaylist(songnames: 'Man In The Mirror', playlistname: pname),
  songplaylist(songnames: 'Guns', playlistname: pname),
  songplaylist(songnames: 'Candy Paint', playlistname: pname),
  songplaylist(songnames: 'Silence', playlistname: pname),
  songplaylist(songnames: 'It Aint Me With Selena Gomez ', playlistname: pname),
  songplaylist(songnames: 'The Ocean Feat Shy Martin', playlistname: pname),
  songplaylist(songnames: 'Despacito', playlistname: pname),
  songplaylist(songnames: 'One More Light', playlistname: pname),
  songplaylist(songnames: 'Better', playlistname: pname),
  songplaylist(songnames: 'Saturday Nights', playlistname: pname),
  songplaylist(songnames: 'Location', playlistname: pname),
  songplaylist(songnames: 'Be Like That ', playlistname: pname),
  songplaylist(songnames: 'Teen', playlistname: pname),
  songplaylist(songnames: 'Eleven Feat Summer Walker', playlistname: pname),
  songplaylist(songnames: 'Know Your Worth', playlistname: pname),
  songplaylist(songnames: 'Otw', playlistname: pname),
  songplaylist(songnames: 'Talk', playlistname: pname),
  songplaylist(songnames: 'Eastside With Halsey  Khalid', playlistname: pname),
  songplaylist(songnames: 'So Done Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'Eleven', playlistname: pname),
  songplaylist(songnames: 'Suncity Feat Empress Of', playlistname: pname),
  songplaylist(songnames: 'Up All Night', playlistname: pname),
  songplaylist(songnames: 'Trigger', playlistname: pname),
  songplaylist(songnames: 'My Bad', playlistname: pname),
  songplaylist(songnames: 'Young Dumb  Broke', playlistname: pname),
  songplaylist(songnames: 'Silence', playlistname: pname),
  songplaylist(songnames: 'Love Lies With Normani', playlistname: pname),
  songplaylist(songnames: 'Bad Luck', playlistname: pname),
  songplaylist(songnames: 'Saved', playlistname: pname),
  songplaylist(songnames: 'Ocean Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'Hundred', playlistname: pname),
  songplaylist(songnames: 'Outta My Head With John Mayer', playlistname: pname),
  songplaylist(songnames: 'Right Back', playlistname: pname),
  songplaylist(songnames: 'Dont Pretend Feat Safe', playlistname: pname),
  songplaylist(songnames: 'Motion', playlistname: pname),
  songplaylist(songnames: 'Electric Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'Coaster', playlistname: pname),
  songplaylist(songnames: 'Beautiful People Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'American Teen', playlistname: pname),
  songplaylist(songnames: 'Vertigo', playlistname: pname),
  songplaylist(songnames: 'Another Sad Love Song', playlistname: pname),
  songplaylist(songnames: 'Lovely With Khalid', playlistname: pname),
  songplaylist(songnames: 'Rollin Feat Future  Khalid', playlistname: pname),
  songplaylist(songnames: 'Paradise', playlistname: pname),
  songplaylist(songnames: 'Youth Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'Twenty One', playlistname: pname),
  songplaylist(songnames: 'Shot Down', playlistname: pname),
  songplaylist(songnames: 'Alive', playlistname: pname),
  songplaylist(songnames: 'Self', playlistname: pname),
  songplaylist(songnames: 'Free Spirit', playlistname: pname),
  songplaylist(songnames: 'Floating Feat Khalid', playlistname: pname),
  songplaylist(songnames: 'Bluffin', playlistname: pname),
  songplaylist(songnames: 'Iktara', playlistname: pname),
  songplaylist(songnames: 'Tum Hi Ho', playlistname: pname),
  songplaylist(songnames: 'Aal Izz Well', playlistname: pname),
  songplaylist(songnames: 'Zoobi Doobi From  Idiots', playlistname: pname),
  songplaylist(songnames: 'Ehsaan', playlistname: pname),
  songplaylist(songnames: 'Humdard', playlistname: pname),
  songplaylist(songnames: 'Agar Tum Saath Ho', playlistname: pname),
  songplaylist(songnames: 'Tum Se Hi', playlistname: pname),
  songplaylist(songnames: 'Yeh Dooriyan', playlistname: pname),
  songplaylist(songnames: 'Pee Loon', playlistname: pname),
  songplaylist(songnames: 'Somebody That I Used To Know', playlistname: pname),
  songplaylist(songnames: 'I Like Me Better', playlistname: pname),
  songplaylist(songnames: 'Billie Jean', playlistname: pname),
  songplaylist(songnames: 'Man In The Mirror', playlistname: pname),
  songplaylist(songnames: 'Numb', playlistname: pname),
  songplaylist(songnames: 'In The End', playlistname: pname),
  songplaylist(songnames: 'Boulevard Of Broken Dreams', playlistname: pname),
  songplaylist(songnames: 'Guns', playlistname: pname),
  songplaylist(songnames: 'Candy Paint', playlistname: pname),
  songplaylist(songnames: 'Circles', playlistname: pname),
  songplaylist(songnames: 'Silence', playlistname: pname),
  songplaylist(songnames: 'Young Dumb  Broke', playlistname: pname),
  songplaylist(songnames: 'Location', playlistname: pname),
  songplaylist(songnames: 'Motion', playlistname: pname),
  songplaylist(songnames: 'It Aint Me With Selena Gomez ', playlistname: pname),
  songplaylist(songnames: 'The Ocean Feat Shy Martin', playlistname: pname),
  songplaylist(songnames: 'Despacito', playlistname: pname),
  songplaylist(songnames: 'Perfect', playlistname: pname),
  songplaylist(songnames: 'Thinking Out Loud', playlistname: pname),
  songplaylist(songnames: 'Just The Way You Are', playlistname: pname),
  songplaylist(songnames: 'Set Fire To The Rain', playlistname: pname),
  songplaylist(songnames: 'Hello', playlistname: pname),
  songplaylist(songnames: 'Faded', playlistname: pname),
  songplaylist(songnames: 'Alone', playlistname: pname),
  songplaylist(songnames: 'Keep Me', playlistname: pname),
  songplaylist(songnames: 'Beautiful', playlistname: pname),
  songplaylist(songnames: 'Dont Matter', playlistname: pname),
  songplaylist(songnames: 'Right Now Na Na Na', playlistname: pname),
  songplaylist(songnames: 'Alone', playlistname: pname),
  songplaylist(songnames: 'Let Me Down Slowly', playlistname: pname),
  songplaylist(songnames: 'Mount Olympus', playlistname: pname),
  songplaylist(songnames: 'Eye Of The Tiger', playlistname: pname),
  songplaylist(songnames: 'Give Me Some Sunshine', playlistname: pname),
  songplaylist(songnames: 'Lucid Dreams', playlistname: pname),
  songplaylist(songnames: 'Grenade', playlistname: pname),
  songplaylist(songnames: 'Dynamite', playlistname: pname),
  songplaylist(songnames: 'Jackie Chan', playlistname: pname),
  songplaylist(songnames: 'Hero', playlistname: pname),
  songplaylist(songnames: 'Addicted', playlistname: pname),
  songplaylist(songnames: 'It Aint Me With Selena Gomez', playlistname: pname),
  songplaylist(songnames: 'Criminal', playlistname: pname),
  songplaylist(songnames: 'Wake Me Up', playlistname: pname),
  songplaylist(
      songnames: 'Wake Me Up When September Ends', playlistname: pname),
  songplaylist(songnames: 'Wishing Well', playlistname: pname),
  songplaylist(
      songnames: 'Death Bed Coffee For Your Head', playlistname: pname),
  songplaylist(songnames: 'Onlyfans', playlistname: pname),
  songplaylist(songnames: 'Exhausted', playlistname: pname),
  songplaylist(songnames: 'So Done', playlistname: pname),
  songplaylist(songnames: 'Dead Eyes', playlistname: pname),
  songplaylist(songnames: 'Chasingdemo', playlistname: pname),
  songplaylist(songnames: 'Leave Me Alone', playlistname: pname),
  songplaylist(songnames: 'Epidemic', playlistname: pname),
  songplaylist(songnames: 'Oohmygod', playlistname: pname),
  songplaylist(songnames: 'Smile With The Weeknd', playlistname: pname),
  songplaylist(songnames: 'Go Feat Juice Wrld', playlistname: pname),
  songplaylist(songnames: 'Righteous', playlistname: pname),
  songplaylist(songnames: 'Jocelyn Flores', playlistname: pname),
  songplaylist(songnames: 'Broken Glass', playlistname: pname),
  songplaylist(songnames: 'The Prayer Pt ', playlistname: pname),
  songplaylist(songnames: 'Streetlights', playlistname: pname),
  songplaylist(songnames: 'Mirror', playlistname: pname),
  songplaylist(songnames: 'Memory', playlistname: pname),
  songplaylist(songnames: 'Stay', playlistname: pname),
  songplaylist(
      songnames: 'I Shouldve Opened My Fucking Eyes', playlistname: pname),
  songplaylist(songnames: 'Snakebit', playlistname: pname),
  songplaylist(songnames: 'Gorgeous', playlistname: pname),
  songplaylist(songnames: 'Jefe', playlistname: pname),
  songplaylist(songnames: 'Quarantine', playlistname: pname),
  songplaylist(songnames: 'Falling Down ', playlistname: pname),
  songplaylist(songnames: 'Demon In Disguise', playlistname: pname),
  songplaylist(songnames: 'Perfect', playlistname: pname),
  songplaylist(songnames: 'Take Your Time', playlistname: pname),
  songplaylist(songnames: 'Lifes A Mess Feat Halsey', playlistname: pname),
  songplaylist(songnames: 'Rah ', playlistname: pname),
  songplaylist(songnames: 'Red Tide', playlistname: pname),
  songplaylist(songnames: 'Falling', playlistname: pname),
  songplaylist(songnames: 'Empty', playlistname: pname),
  songplaylist(songnames: 'Save Me', playlistname: pname),
  songplaylist(songnames: 'Keys To The Benz', playlistname: pname),
  songplaylist(songnames: 'After Hours', playlistname: pname),
  songplaylist(songnames: 'Friends Feat Powfu', playlistname: pname),
  songplaylist(songnames: 'I Still Think Of U', playlistname: pname),
  songplaylist(songnames: 'Only One', playlistname: pname),
  songplaylist(
      songnames: 'Tell Me U Luv Me With Trippie Redd', playlistname: pname),
  songplaylist(
      songnames: 'Suicidal Remix Feat Juice Wrld', playlistname: pname),
  songplaylist(songnames: 'Church', playlistname: pname),
  songplaylist(songnames: 'Im Used To It', playlistname: pname),
  songplaylist(songnames: 'Dead And Cold', playlistname: pname),
  songplaylist(songnames: 'Love Me More', playlistname: pname),
  songplaylist(songnames: 'Let You Down', playlistname: pname),
  songplaylist(songnames: 'I Fall Apart', playlistname: pname),
  songplaylist(
      songnames: 'Let Me Know I Wonder Why Freestyle', playlistname: pname),
  songplaylist(songnames: 'Wanna Grow Old I Wont Let Go', playlistname: pname),
  songplaylist(songnames: 'Bad Vibes Forever', playlistname: pname),
  songplaylist(songnames: 'Strings', playlistname: pname),
  songplaylist(songnames: 'Insecure', playlistname: pname),
  songplaylist(songnames: 'Costa Rica', playlistname: pname),
  songplaylist(songnames: 'Love Me', playlistname: pname),
  songplaylist(songnames: 'Without You', playlistname: pname),
  songplaylist(songnames: 'Lost', playlistname: pname),
  songplaylist(songnames: 'Worst Day Of My Life', playlistname: pname),
  songplaylist(songnames: 'Break Ups Suck Ass', playlistname: pname),
  songplaylist(songnames: 'Hearteater', playlistname: pname),
  songplaylist(songnames: 'Try', playlistname: pname),
  songplaylist(songnames: 'Ugly', playlistname: pname),
  songplaylist(songnames: 'I Hate That', playlistname: pname),
  songplaylist(songnames: 'Gone Girl', playlistname: pname),
  songplaylist(songnames: 'Nate', playlistname: pname),
  songplaylist(songnames: 'Saint', playlistname: pname),
  songplaylist(songnames: 'Lil Mama', playlistname: pname),
  songplaylist(songnames: 'Did It Again', playlistname: pname),
  songplaylist(songnames: 'Hurt', playlistname: pname),
  songplaylist(songnames: 'Sad', playlistname: pname),
  songplaylist(songnames: 'Ransom With Juice Wrld ', playlistname: pname),
  songplaylist(songnames: 'Time ', playlistname: pname),
  songplaylist(songnames: 'When I Grow Up', playlistname: pname),
  songplaylist(songnames: 'Fuck Love Feat Trippie Redd', playlistname: pname),
  songplaylist(songnames: 'The Search', playlistname: pname),
  songplaylist(songnames: 'When We Were ', playlistname: pname),
  songplaylist(songnames: 'Pull It', playlistname: pname),
  songplaylist(songnames: 'How Could You Leave Us', playlistname: pname),
  songplaylist(songnames: 'Emotions', playlistname: pname),
  songplaylist(songnames: 'Never', playlistname: pname),
];

List<songplaylist> _listItem3 = _listItem2;
String str2;

class songplaylist {
  String songnames;
  String playlistname;
  songplaylist({this.songnames, this.playlistname});
}

List<songplaylist> addsongs = [];
List<songplaylist> addsongs2 = [];
List<dynamic> addsongs5 = [];

String pname2 = "";

class Myplaylist extends StatefulWidget {
  ValueSetter<String> _valueSetter5;
  Myplaylist(this._valueSetter5);
  @override
  _MyplaylistState createState() => _MyplaylistState();
}

class _MyplaylistState extends State<Myplaylist> {
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() {
    addsongs5.clear();
    dbref.once().then((DataSnapshot printtt) {
      Map<dynamic, dynamic> values = printtt.value;
      values.forEach((key, values) {
        if (values["playlistname"] == pname2) {
          setState(() {
            addsongs5.add(values);
          });
        }
      });
    });
  }

  void deletenode(String str) {
    dbref.once().then((DataSnapshot printtt) {
      Map<dynamic, dynamic> values = printtt.value;
      values.forEach((key, values) {
        if (values["songname"] == str) {
          dbref.child(key).remove();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (addsongs5.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.navigate_before_rounded,
            ),
          ),
          title: Text(
            pname2,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.navigate_before_rounded,
            ),
          ),
          title: Text(
            pname2,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView.builder(
            itemCount: addsongs5.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  // for (int val = 0; val < addsongs5.length; val++)
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.music_note,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          addsongs5[index]["songname"],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                        onPressed: () {
                          if (addsongs5.length == 1) {
                            deletenode(addsongs5[index]["songname"].toString());
                            setState(
                              () {
                                str2 = addsongs5[index]["playlistname"];
                                addsongs5.removeAt(index);
                                setState(() {
                                  pnames2.remove(pname2);
                                  correction = pname2;
                                });
                                widget._valueSetter5(pname2);
                                corr.add(pname2);
                                Navigator.of(context).pop();
                              },
                            );
                          } else {
                            deletenode(addsongs5[index]["songname"].toString());
                            setState(
                              () {
                                str2 = addsongs5[index]["playlistname"];
                                addsongs5.removeAt(index);
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  // CircularProgressIndicator(),
                ],
              );
            },
            // child: FutureBuilder(
            //   future: dbref.orderByChild("playlistname").equalTo(pname2).once(),
            //   builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       checkingag.clear();
            //       checkingag2.clear();
            //       Map<dynamic, dynamic> values = snapshot.data.value;
            //       values.forEach(
            //         (key, values) {
            //           checkingag.add(values);
            //           checkingag2.add(values["songname"].toString());
            //         },
            //       );
            //       return new ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: checkingag2.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Column(
            //             children: [
            //               // for (int val = 0; val < addsongs5.length; val++)
            //               Row(
            //                 children: <Widget>[
            //                   Icon(
            //                     Icons.music_note,
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsets.only(left: 20),
            //                     child: Text(
            //                       checkingag2[index],
            //                     ),
            //                   ),
            //                   Spacer(),
            //                   IconButton(
            //                     icon: CircleAvatar(
            //                       backgroundColor: Colors.grey[800],
            //                       child: Icon(
            //                         Icons.remove,
            //                       ),
            //                     ),
            //                     onPressed: () {
            //                       // deletenode(
            //                       //     addsongs5[index]["songname"].toString());
            //                       deletenode(
            //                           checkingag[index]["songname"].toString());
            //                       // setState(
            //                       //   () {
            //                       //     str2 = checkingag[index]["playlistname"];
            //                       //     checkingag2.removeAt(index);
            //                       //   },
            //                       // );
            //                       Navigator.of(context).pop();

            //                       showDialog(
            //                         context: context,
            //                         builder: (BuildContext context) =>
            //                             _buildPopupDialog2(context),
            //                       );
            //                     },
            //                   ),
            //                 ],
            //               ),
            //               // CircularProgressIndicator(),
            //             ],
            //           );
            //         },
            //       );
            //     }
            //     return Center(child: CircularProgressIndicator());
            //   },
            // ),
          ),
        ),
      );
    }
  }
}

List<String> corr = [];
String correction;

List<dynamic> checkingag = [];
List<String> checkingag2 = [];
