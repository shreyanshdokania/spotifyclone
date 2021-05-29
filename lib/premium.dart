import 'package:flutter/material.dart';

class Premium extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 90),
              child: Center(
                child: Text(
                  "Get more out of your\nmusic with Premium",
                  style: TextStyle(
                    fontFamily: 'SpotifyFont',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 120,
              child: PageView(
                controller: PageController(viewportFraction: 0.74),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: Colors.grey[850],
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "FREE",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Ad breaks",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: Colors.green.shade400,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF191414),
                              Color.fromRGBO(40, 96, 65, 7.0),
                            ],
                            begin: Alignment.topLeft,
                            end: FractionalOffset(0.5, 0.7),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "PREMIUM",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Ad-free music",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: Colors.grey[850],
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "FREE",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Streaming",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            Text(
                              "only",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: Colors.green.shade400,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF191414),
                              Color.fromRGBO(40, 96, 65, 7.0),
                            ],
                            begin: Alignment.topLeft,
                            end: FractionalOffset(0.5, 0.7),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "PREMIUM",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Download",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            Text(
                              "songs",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: Colors.grey[850],
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "FREE",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Listen alone",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: Colors.green.shade400,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF191414),
                              Color.fromRGBO(40, 96, 65, 7.0),
                            ],
                            begin: Alignment.topLeft,
                            end: FractionalOffset(0.5, 0.7),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "PREMIUM",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 12,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Group sessions",
                              style: TextStyle(
                                fontFamily: 'SpotifyFont',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: ButtonTheme(
                height: 50,
                minWidth: 200,
                buttonColor: Colors.white70,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  onPressed: () {},
                  child: Text(
                    "GET PREMIUM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Terms and conditions apply",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SpotifyFont',
                  color: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey[850],
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Spotify Free",
                    style: TextStyle(
                      fontFamily: 'SpotifyFont',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1.5,
                      color: Colors.grey[300],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "CURRENT PLAN",
                    style: TextStyle(
                      fontFamily: 'SpotifyFont',
                      fontSize: 12,
                      letterSpacing: 1.5,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[900],
                    Colors.purple[300],
                  ],
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.6, 1.3),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      Text(
                        "\n\nPremium Family",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.grey[300],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "\nFrom Rs199",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            "FOR 1 MONTH",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 10,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Text(
                          "Choose 1,3,6 or 12 months of Premium +\nPay with Paytm or UPI.Top up when you\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\twant",
                          style: TextStyle(
                            fontFamily: 'SpotifyFont',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 170,
                          buttonColor: Colors.white70,
                          child: FlatButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VIEW PLANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Prices vary according to duration of plan.Terms and conditions\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tapply",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[300],
                    Colors.blue[700],
                  ],
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.6, 0.8),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      Text(
                        "\n\Mini",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.grey[300],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "\nFrom Rs7",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            "FOR 1 DAY",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 10,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Text(
                          "\tDay and week plans . Ad-free music on\nmobile . Download 30 songs on 1 mobile\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tdevice",
                          style: TextStyle(
                            fontFamily: 'SpotifyFont',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 170,
                          buttonColor: Colors.white70,
                          child: FlatButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VIEW PLANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Prices vary according to duration of plan.Terms and conditions\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tapply",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF191414),
                    Color.fromRGBO(40, 96, 65, 7.0),
                  ],
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.6, 0.8),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      Text(
                        "\nPremium Indivisual",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.grey[300],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "\nFrom Rs129",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            "FOR 1 MONTH",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 10,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Text(
                          "Ad-free music . Download to listen offline",
                          style: TextStyle(
                            fontFamily: 'SpotifyFont',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 170,
                          buttonColor: Colors.white70,
                          child: FlatButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VIEW PLANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Prices vary according to duration of plan.Terms and conditions\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tapply",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[400],
                    Color.fromRGBO(0, 91, 162, 80),
                  ],
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.6, 0.8),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      Text(
                        "\n\Premium Duo",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.grey[300],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "\nFrom Rs165",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            "FOR 1 MONTH",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 10,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Text(
                          "\t2 Premium accounts . For couples who\nlive together . Ad-free music . Download\n 10,000 songs/device, on up to 5 devices\nper account . Choose 1,3,6 or 12 months\nof Premium . Pay with Paytm or UPI. Top \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tup when you want",
                          style: TextStyle(
                            fontFamily: 'SpotifyFont',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 170,
                          buttonColor: Colors.white70,
                          child: FlatButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VIEW PLANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Prices vary according to duration of plan.Terms and conditions\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tapply",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 32, 0),
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange[200],
                    Colors.yellow[700],
                  ],
                  begin: Alignment.topLeft,
                  end: FractionalOffset(0.6, 0.6),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      Text(
                        "\nPremium Student",
                        style: TextStyle(
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "\nFrom Rs66",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey[300],
                            ),
                          ),
                          Text(
                            "FOR 1 MONTH",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 10,
                              letterSpacing: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        Text(
                          "Ad-free music . Download to listen offline",
                          style: TextStyle(
                            fontFamily: 'SpotifyFont',
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 170,
                          buttonColor: Colors.white70,
                          child: FlatButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "VIEW PLANS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            "Offer available only to students at an accredited higher\n\t\t\t\t\t\education institution . Terms and condition apply",
                            style: TextStyle(
                              fontFamily: 'SpotifyFont',
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: Colors.white,
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
