import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:intl/intl.dart";

class ToggleAppliances extends StatefulWidget {
  @override
  _ToggleAppliancesState createState() => _ToggleAppliancesState();
}

class _ToggleAppliancesState extends State<ToggleAppliances> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String documentId =
      FirebaseFirestore.instance.collection("HotelTransaction").id;
  var userId;

  jaishreeram() {
    FirebaseFirestore.instance
        .collection("HotelTransaction")
        .doc(documentId)
        .get()
        .then((value) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("HotelTransaction")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data.docs.map((e) {
                return ListTile(
                  trailing: CupertinoSlidingSegmentedControl(
                      children: lightsToggle,
                      groupValue: lightsControl,
                      onValueChanged: (value) {
                        if (e["Appliances"] == "Light") {
                          setState(() {
                            lightsControl = value;
                          });
                          if (lightsControl == 1) {
                            databaseReference.update({"LED_STATUS": 1});
                          }
                        }
                      }),
                  title: Text(
                    e["Appliances"],
                    style: TextStyle(fontSize: 30.0),
                  ),
                );
              }).toList(),
            );
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    var userID = user.uid;
    setState(() {
      userId = userID;
    });
  }

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

  int powerSocketControl1 = 0;
  final Map<int, Widget> powerSocketToggle1 = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int powerSocketControl2 = 0;
  final Map<int, Widget> powerSocketToggle2 = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int coffeeMakerControl = 0;
  final Map<int, Widget> coffeeMakerToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  int nightLampControl = 0;
  final Map<int, Widget> nightLampToggle = const <int, Widget>{
    0: Text("OFF"),
    1: Text("ON")
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle appliances"),
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.purple[400],
      ),
      body: jaishreeram(),
    );
  }
}
