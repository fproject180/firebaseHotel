import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:intl/intl.dart";
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ToggleAppliances extends StatefulWidget {
  var value;
  ToggleAppliances({Key key, @required this.value}) : super(key: key);
  @override
  _ToggleAppliancesState createState() => _ToggleAppliancesState(value: value);
}

class _ToggleAppliancesState extends State<ToggleAppliances> {
  var value;
  _ToggleAppliancesState({this.value});

  final databaseReference = FirebaseDatabase.instance.reference();
  RefreshController controller;

  var userId;
  var docId;

  @override
  void initState() {
    //getApplianceList();
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    var userID = user.uid;
    setState(() {
      userId = userID;
    });
    super.initState();
  }

  getApplianceList() {
    FirebaseFirestore.instance
        .collection("HotelTransaction")
        .doc(value)
        .get()
        .then((value) {
      appliances = value.get("Appliances");
    });
    print(appliances);
    print(value);
  }

  List appliances = [];

  var fan;
  var lights;
  var tv;
  var ac;
  var coffeMaker;
  var powerSocket1;
  var powerSocket2;
  var nightLamp;

  DateFormat dateFormat = DateFormat.yMd().add_jm();

  String nightLampTime;

  int fanControl = 0;
  final Map<int, Widget> fanToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int lightsControl = 0;
  final Map<int, Widget> lightsToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int tvControl = 0;
  final Map<int, Widget> tvToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int acControl = 0;
  final Map<int, Widget> acToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int coffeeMakerControl = 0;
  final Map<int, Widget> coffeeMakerToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          bottomOpacity: 0.0,
          backgroundColor: Colors.purple[400],
        ),
        body: Column(
          children: [
            Container(
              child: Center(
                child: Text("Toggle appliances",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.purple[400],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  ListTile(
                    title: Text("Lights"),
                    trailing: CupertinoSlidingSegmentedControl(
                      children: lightsToggle,
                      backgroundColor: lightsControl == 1
                          ? Colors.greenAccent[400]
                          : Colors.redAccent,
                      groupValue: lightsControl,
                      onValueChanged: (value) {
                        setState(() {
                          lightsControl = value;
                        });
                        if (lightsControl == 0) {
                          databaseReference.update({"LED_STATUS": 0});
                        } else if (lightsControl == 1) {
                          databaseReference.update({"LED_STATUS": 1});
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Fans"),
                    trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: fanControl == 1
                          ? Colors.greenAccent[400]
                          : Colors.redAccent,
                      children: fanToggle,
                      groupValue: fanControl,
                      onValueChanged: (value) {
                        setState(() {
                          fanControl = value;
                        });
                        if (fanControl == 0) {
                          databaseReference.update({"FAN_STATUS": 0});
                        } else if (fanControl == 1) {
                          databaseReference.update({"FAN_STATUS": 1});
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("AC"),
                    trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: acControl == 1
                          ? Colors.greenAccent[400]
                          : Colors.redAccent,
                      children: acToggle,
                      groupValue: acControl,
                      onValueChanged: (value) {
                        setState(() {
                          acControl = value;
                        });
                        if (acControl == 0) {
                          databaseReference.update({"AC_STATUS": 0});
                        } else if (acControl == 1) {
                          databaseReference.update({"AC_STATUS": 1});
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Coffee Maker"),
                    trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: coffeeMakerControl == 1
                          ? Colors.greenAccent[400]
                          : Colors.redAccent,
                      children: coffeeMakerToggle,
                      groupValue: coffeeMakerControl,
                      onValueChanged: (value) {
                        setState(() {
                          coffeeMakerControl = value;
                        });
                        if (coffeeMakerControl == 0) {
                          databaseReference.update({"COFFEE_STATUS": 0});
                        } else if (coffeeMakerControl == 1) {
                          databaseReference.update({"COFFEE_STATUS": 1});
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
