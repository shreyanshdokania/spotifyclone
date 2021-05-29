import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'mainpage.dart';

class Songplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int indexofsong = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splayer(songname: indexofsong),
    );
  }
}

class Splayer extends StatefulWidget {
  int songname;
  ValueSetter<String> valueSetter;
  Splayer({this.songname});
  @override
  _SplayerState createState() => _SplayerState(songname);
}

class _SplayerState extends State<Splayer> {
  int songname;
  _SplayerState(this.songname);

  bool playing = false;
  IconData playbtn = Icons.play_arrow_outlined;

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musiclength = new Duration();

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.blueGrey[800],
          value: position.inSeconds.toDouble(),
          max: musiclength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.durationHandler = (d) {
      setState(() {
        musiclength = d;
      });
    };

    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  double dx;

  Route _createRoute(index, dx) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Songplayer(),
        settings: RouteSettings(
          arguments: songname,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(dx, 0.0);
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: FractionalOffset(0.2, 0.7),
              colors: [
                Color(0xFF414345),
                Color(0xFF000000),
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 48.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "PLAYING FROM LIBRARY",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    ":)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 300.0,
                    height: 390.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageurl[songname]),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      txt[songname],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 15.0),
                          width: 400.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              slider(),
                              Text(
                                "${musiclength.inMinutes}:${musiclength.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 35.0,
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shuffle,
                                ),
                              ),
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.white,
                                onPressed: () {
                                  if (songname >= 0 &&
                                      songname <= imageurl.length) {
                                    setState(() {
                                      songname = songname - 1;
                                      dx = -1.0;
                                    });
                                    Navigator.of(context)
                                        .push(_createRoute(songname, dx));
                                  } else {
                                    setState(() {
                                      songname = songname + 1;
                                      dx = -1.0;
                                    });
                                    Navigator.of(context)
                                        .push(_createRoute(songname, dx));
                                  }
                                },
                                icon: Icon(
                                  Icons.skip_previous_outlined,
                                ),
                              ),
                              IconButton(
                                iconSize: 82.0,
                                color: Colors.white,
                                onPressed: () {
                                  if (!playing) {
                                    cache.play(songs[songname]);
                                    setState(() {
                                      playbtn = Icons.pause_circle_outline;
                                      playing = true;
                                    });
                                  } else {
                                    _player.pause();
                                    setState(() {
                                      playbtn = Icons.play_arrow_outlined;
                                      playing = false;
                                    });
                                  }
                                  // widget.valueSetter(songs[songname]);
                                },
                                icon: Icon(
                                  playbtn,
                                ),
                              ),
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.white,
                                onPressed: () {
                                  if (songname >= 0 &&
                                      songname <= imageurl.length) {
                                    setState(() {
                                      songname = songname + 1;
                                      dx = 1.0;
                                    });
                                    Navigator.of(context)
                                        .push(_createRoute(songname, dx));
                                  }
                                },
                                icon: Icon(
                                  Icons.skip_next_outlined,
                                ),
                              ),
                              IconButton(
                                iconSize: 35.0,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.replay_10_outlined,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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

List<String> recents = [];
