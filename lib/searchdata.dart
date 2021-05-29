import 'package:flutter/material.dart';
import 'package:sp/search.dart';
import 'playlist.dart';
import 'package:firebase_database/firebase_database.dart';

class Searchdata extends StatefulWidget {
  @override
  _SearchdataState createState() => _SearchdataState();
}

class _SearchdataState extends State<Searchdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 450,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text("okay"),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: FractionalOffset(0.0, 1.1),
                    colors: [
                      Color.fromRGBO(39, 80, 98, 1.0),
                      Color(0xFF000000),
                    ],
                  ),
                ),
                height: 900,
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 240,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/eminem.jpeg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      passsearchdata,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Top Collections",
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            // backgroundImage: AssetImage(artistpage[index].asset),
                            backgroundColor: Colors.green[400],
                            child: IconButton(
                              onPressed: () {},
                              iconSize: 30,
                              icon: Icon(
                                Icons.play_arrow,
                              ),
                            ),
                            minRadius: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.0, 0.0),
                  colors: [
                    Color.fromRGBO(39, 80, 98, 1.0),
                    Color(0xFF000000),
                  ],
                ),
              ),
              child: FutureBuilder(
                future: dbref7.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    data2.clear();
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach(
                      (key, values) {
                        data2.add(values);
                      },
                    );
                    return new ListView.builder(
                      shrinkWrap: true,
                      itemCount: data2.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    iconSize: 40,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.music_note,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data2[index]["songname"],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SpotifyFont',
                                        ),
                                      ),
                                      Text(
                                        "Artistname",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                    size: 27,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<dynamic> data2 = [];

List<String> searchdata = [
  "Bollywood",
  "Punjabi",
  "Tamil",
  "Telugu",
  "Indie",
  "Pop",
  "Radar",
  "Marathi",
  "Devotional",
  "Indian classic",
  "Romance",
  "K-Pop",
  "Party",
  "Instrumental",
  "Dance/Electronic",
  "Decades",
  "Student",
  "Higher Ground",
  "Hip Hop",
  "Workout",
  "Happy Holidays",
  "At Home",
];

List<String> _listItem = [
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
