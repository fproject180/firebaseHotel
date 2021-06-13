import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hotel/pages/receiptPage.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Container(
                    height: 105.0,
                    width: 250.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Receipt()));
                            },
                            icon: Icon(Icons.request_quote_outlined),
                            iconSize: 40.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Proceed to Final Bill",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
