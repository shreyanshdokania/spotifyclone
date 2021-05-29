import 'package:flutter/material.dart';
import 'songplayer.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:firebase_database/firebase_database.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Route _createRoute(index) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Songplayer(),
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

  Color iconcolor = Colors.white;
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(40, 96, 65, 7.0),
          Color(0xFF191414),
        ], begin: Alignment.topLeft, end: FractionalOffset(0.3, 0.3)),
      ),
      child: ListView(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(22.0),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          iconcolor = Colors.grey;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settingspage(),
                          ),
                        );
                        iconcolor = Colors.white;
                      },
                      color: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        child: IconTheme(
                          data: IconThemeData(
                            color: iconcolor,
                          ),
                          child: Icon(
                            Icons.settings_sharp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 250.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Recently Played',
                        style: TextStyle(
                            color: Colors.white.withOpacity(1.0),
                            fontSize: 23.0,
                            fontFamily: 'SpotifyFont',
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        height: 165.0,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 130.0,
                                  width: 140.0,
                                  child: Image.asset(
                                    'assets/eminem.jpeg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Text(
                                  'This Is Eminem',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(1.0),
                                    fontFamily: 'SpotifyFont',
                                    fontSize: 10.0,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 290.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Made for you',
                        style: TextStyle(
                            color: Colors.white.withOpacity(1.0),
                            fontSize: 23.0,
                            fontFamily: 'SpotifyFont',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 210.0,
                        width: 210.0,
                        child: Image.asset(
                          'assets/Selection_004.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'Songs you loved most this year,\nall wrapped up',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.5,
                            fontFamily: 'SpotifyFont'),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '  To get you started',
                        style: TextStyle(
                            color: Colors.white.withOpacity(1.0),
                            fontSize: 18.0,
                            fontFamily: 'SpotifyFont',
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                      ),
                      Container(
                        height: 170.0, //exact 170 for this column
                        child: ListView.builder(
                          itemCount: imageurl.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                IconButton(
                                  // height: 130.0,
                                  // width: 140.0,
                                  iconSize: 130.0,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(_createRoute(index));
                                  },
                                  icon: Image.asset(
                                    imageurl[index],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Text(
                                  txt[index],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(1.0),
                                    fontFamily: 'SpotifyFont',
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '  Try something else',
                        style: TextStyle(
                            color: Colors.white.withOpacity(1.0),
                            fontSize: 18.0,
                            fontFamily: 'SpotifyFont',
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                      ),
                      Container(
                        height: 170.0, //exact 170 for this column
                        child: ListView.builder(
                          itemCount: imageurl.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                IconButton(
                                  iconSize: 130.0,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(_createRoute(index));
                                  },
                                  icon: Image.asset(
                                    imageurl[index],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5.0)),
                                Text(
                                  txt[index],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(1.0),
                                    fontFamily: 'SpotifyFont',
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            );
                          },
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
    );
  }
}

List<String> imageurl = [
  'assets/umbrella.png',
  'assets/avicii_thenights.jpg',
  'assets/memories.jpg',
  'assets/lovely_khalid.jpg',
  'assets/faded.jpg',
  'assets/closer.jpg',
  'assets/senorita_camila.jpg',
  'assets/shape_of_you.jpg',
];
List<String> txt = [
  'Umbrella',
  "Avicii",
  'Memories',
  "Lovely",
  'Faded',
  "Closer",
  'Senorita',
  "Shape of you",
];

List<String> songs = [
  'umbrella.mp3',
  'avicii_thenights.mp3',
  'memories.mp3',
  'lovely_khalid.mp3',
  'faded.mp3',
  'closer.mp3',
  'senorita_camila.mp3',
  'shape_of_you.mp3',
];

final dbref2 = FirebaseDatabase.instance.reference().child("feedbacks");

class Settingspage extends StatefulWidget {
  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.navigate_before,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'SpotifyFont',
            fontSize: 16.5,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Free Account",
              style: TextStyle(
                fontFamily: 'SpotifyFont',
                fontSize: 18,
                letterSpacing: 0.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ButtonTheme(
              height: 50,
              minWidth: 200,
              buttonColor: Colors.white,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Text(
                  "GO PREMIUM",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Help and Feedback",
                    style: TextStyle(
                      fontFamily: 'SpotifyFont',
                      color: Colors.white,
                      fontSize: 15.2,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => popup(context),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 4.2,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send a Feedback",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Your honest opnion is really appretiated",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String name, feedback;
Widget popup(BuildContext context) {
  sendMail() async {
    String username = 'sd6778120@gmail.com';
    String password = 'X4PNS3TxSmG!TP-';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('shreyanshdokania@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'NEW FEEDBACK 😀 ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<p>Name : $name</p><p>Feedback : $feedback</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      // Toast.show("Thank You for your time!", context,
      //     duration: 3, gravity: Toast.CENTER);
      name = "";
      feedback = "";
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  return AlertDialog(
    backgroundColor: Colors.black,
    title: Center(
      child: Text(
        'Details',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  // hintText: 'EMAIL',
                  // hintStyle: ,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                controller: t1,
                onChanged: (String str) {
                  name = str;
                },
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                maxLines: 2,
                // textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                controller: t2,
                onChanged: (String str) {
                  feedback = str;
                },
              ),
              SizedBox(height: 30.0),
              Container(
                height: 50.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: ButtonTheme(
                      height: 45,
                      minWidth: 100,
                      buttonColor: Colors.white,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          dbref2.push().set({
                            "username": name,
                            "feedback": feedback,
                          });
                          if (name.length == 0) {
                            Toast.show("Please enter your name", context,
                                duration: 3, gravity: Toast.CENTER);
                          } else if (feedback.length == 0) {
                            Toast.show("Please enter some feedback", context,
                                duration: 3, gravity: Toast.CENTER);
                          } else {
                            sendMail();
                            Navigator.of(context).pop();
                            Toast.show("Thank You for your time!", context,
                                duration: 3, gravity: Toast.CENTER);
                          }
                        },
                        child: Text(
                          "SEND",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ],
    ),
  );
}
