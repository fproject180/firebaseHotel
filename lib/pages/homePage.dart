import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/components/bottomNavbarconfig.dart';
import 'package:hotel/components/drawerConfig.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerConfig(),
      bottomNavigationBar: BottomNavConfig(),
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.purple[400],
        title: Text("Book Room"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(CupertinoIcons.bell), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple[400], Colors.purple[400]]),
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Center(
                      child: AnimatedTextKit(animatedTexts: [
                        TypewriterAnimatedText("Welcome!",
                            textStyle: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: "pacifico"),
                            speed: Duration(milliseconds: 500)),
                        TypewriterAnimatedText("नमस्ते!",
                            textStyle: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 500)),
                        TypewriterAnimatedText("ようこそ!",
                            textStyle: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 500)),
                        TypewriterAnimatedText("Welcome!",
                            textStyle: TextStyle(
                                fontSize: 45.0,
                                color: Colors.white,
                                fontFamily: "pacifico",
                                fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 500)),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        child: CupertinoSearchTextField(
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.green[200],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.business,
                                size: 40.0,
                                color: Colors.green[800],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Select Hotel",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    color: Colors.blue[200],
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                              child: Icon(
                                Icons.add_shopping_cart_sharp,
                                size: 40.0,
                                color: Colors.blue[800],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Control",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Appliances",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    color: Colors.yellow[200],
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.room_preferences,
                                size: 40.0,
                                color: Colors.yellow[800],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Select",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.yellow[800],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Room Type",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.yellow[800],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    color: Colors.red[200],
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                              child: Icon(
                                Icons.date_range_outlined,
                                size: 40.0,
                                color: Colors.red[800],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Select Date",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
