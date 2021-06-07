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
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.purple[400],
      ),
      body: Column(
        children: [
          Container(
            height: 150.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.purple[400],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Toggle Appliances",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: fanControl == 1
                      ? Icon(
                          Icons.air,
                          color: Colors.blue,
                          size: 30.0,
                        )
                      : Icon(
                          Icons.air,
                          size: 30.0,
                        ),
                  title: Text("Fan"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: fanControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: fanToggle,
                      groupValue: fanControl,
                      onValueChanged: (value) {
                        setState(() {
                          fanControl = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: lightsControl == 1
                      ? Icon(
                          Icons.emoji_objects_rounded,
                          color: Colors.yellow[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.emoji_objects_outlined,
                          size: 30.0,
                        ),
                  title: Text("Lights"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: lightsControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: lightsToggle,
                      groupValue: lightsControl,
                      onValueChanged: (value) {
                        setState(() {
                          lightsControl = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: tvControl == 1
                      ? Icon(
                          Icons.live_tv_rounded,
                          color: Colors.green[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.tv,
                          size: 30.0,
                        ),
                  title: Text("Television"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: tvControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: tvToggle,
                      groupValue: tvControl,
                      onValueChanged: (value) {
                        setState(() {
                          tvControl = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: acControl == 1
                      ? Icon(
                          Icons.ac_unit_rounded,
                          color: Colors.blue[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.ac_unit_rounded,
                          size: 30.0,
                        ),
                  title: Text("AC"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: acControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: acToggle,
                      groupValue: acControl,
                      onValueChanged: (value) {
                        setState(() {
                          acControl = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: coffeeMakerControl == 1
                      ? Icon(
                          Icons.coffee_maker_rounded,
                          color: Colors.brown[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.coffee_maker_outlined,
                          size: 30.0,
                        ),
                  title: Text("Coffee Maker"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: coffeeMakerControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: coffeeMakerToggle,
                      groupValue: coffeeMakerControl,
                      onValueChanged: (value) {
                        setState(() {
                          coffeeMakerControl = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: powerSocketControl2 == 1
                      ? Icon(
                          Icons.electrical_services_rounded,
                          color: Colors.blue[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.electrical_services_rounded,
                          size: 30.0,
                        ),
                  title: Text("Power Socket"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: powerSocketControl2 == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: powerSocketToggle2,
                      groupValue: powerSocketControl2,
                      onValueChanged: (value) {
                        setState(() {
                          powerSocketControl2 = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: powerSocketControl1 == 1
                      ? Icon(
                          Icons.outlet_rounded,
                          color: Colors.blue[800],
                          size: 30.0,
                        )
                      : Icon(
                          Icons.outlet_outlined,
                          size: 30.0,
                        ),
                  title: Text("Power Socket"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: powerSocketControl1 == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: powerSocketToggle1,
                      groupValue: powerSocketControl1,
                      onValueChanged: (value) {
                        setState(() {
                          powerSocketControl1 = value;
                        });
                      })),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                  leading: nightLampControl == 1
                      ? Icon(
                          Icons.flourescent_rounded,
                          size: 30.0,
                          color: Colors.lightGreenAccent[400],
                        )
                      : Icon(
                          Icons.flourescent_outlined,
                          size: 30.0,
                        ),
                  title: Text("Night Lamp"),
                  trailing: CupertinoSlidingSegmentedControl(
                      backgroundColor: nightLampControl == 0
                          ? CupertinoColors.destructiveRed
                          : CupertinoColors.systemGreen,
                      children: nightLampToggle,
                      groupValue: nightLampControl,
                      onValueChanged: (value) {
                        setState(() {
                          nightLampControl = value;
                        });
                        if (nightLampControl == 1) {
                          setState(() {
                            nightLamp = DateTime.now();
                            nightLampTime = dateFormat.format(nightLamp);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(nightLampTime),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ));
                        }
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
