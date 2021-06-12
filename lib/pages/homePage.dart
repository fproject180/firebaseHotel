import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/components/bottomNavbarconfig.dart';
import 'package:hotel/components/drawerConfig.dart';
import 'package:hotel/pages/selectAppliance.dart';

import 'package:hotel/pages/toggleAppliances.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  var hotelName;
  var roomType;
  var _range;
  var selectedAppliances;

  var hotelID;
  var selectedDate = DateTime.now();
  List roomTypeList = [];
  List appliancesList = [];

  getRoomList() {
    FirebaseFirestore.instance
        .collection("HotelInfo")
        .doc(hotelID)
        .get()
        .then((value) {
      setState(() {
        roomTypeList = value.get("HotelRoomType");
      });
    });
  }

  getApplianceList() {
    FirebaseFirestore.instance
        .collection("HotelInfo")
        .doc(hotelID)
        .get()
        .then((value) {
      setState(() {
        appliancesList = value.get("HotelRoomAppliance");
      });
    });
  }

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
          IconButton(
              icon: Icon(CupertinoIcons.bell),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Selected Items"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          TextButton(onPressed: () {}, child: Text("Proceed"))
                        ],
                        content: Column(
                          children: [
                            ListTile(
                              title: Text("Hotel: $hotelName"),
                            ),
                            ListTile(
                              title: Text("Room Type: $roomType"),
                            ),
                            ListTile(
                              title: Text("Date: $_range"),
                            ),
                            ListTile(
                              title: Text("Appliances: $selectedAppliances"),
                            ),
                          ],
                        ),
                      );
                    });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.purple[400],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
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
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("HotelInfo")
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  return CupertinoActionSheet(
                                    title: Text("Select Hotel List"),
                                    actions: snapshot.data.docs.map((e) {
                                      return CupertinoActionSheetAction(
                                          onPressed: () {
                                            setState(() {
                                              hotelName = e["HotelName"];
                                              hotelID = e.id;
                                            });
                                            print(hotelID);
                                            Navigator.pop(context);
                                          },
                                          child: Text(e['HotelName']));
                                    }).toList(),
                                    cancelButton: CupertinoButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  );
                                });
                          });
                    },
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
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      getApplianceList();
                      print(appliancesList);
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                                title: Text("Select Appliances"),
                                cancelButton: CupertinoButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                actions: appliancesList.map((e) {
                                  return CupertinoActionSheetAction(
                                      onPressed: () {
                                        setState(() {
                                          selectedAppliances = e;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(e));
                                }).toList());
                          });
                    },
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
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      getRoomList();

                      print(roomTypeList);

                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                                title: Text("Room List"),
                                message:
                                    Text("Select Room Type of your choices"),
                                cancelButton: CupertinoButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                actions: roomTypeList.map((e) {
                                  return CupertinoActionSheetAction(
                                      onPressed: () {
                                        setState(() {
                                          roomType = e;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(e));
                                }).toList());
                          });
                    },
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
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.white,
                              child: SfDateRangePicker(
                                showActionButtons: true,
                                cancelText: "Cancel",
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                allowViewNavigation: true,
                                onCancel: () {
                                  Navigator.pop(context);
                                },
                                onSubmit: (value) {
                                  setState(() {
                                    _range = value;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          });
                    },
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
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width / 1.2,
              child: InkWell(
                onTap: () {
                  var id = FirebaseFirestore.instance
                      .collection('HotelTransaction')
                      .add({
                    'HotelName': hotelName,
                    'RoomType': roomType,
                    "StayDate": selectedDate,
                    "Appliances": selectedAppliances
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ToggleAppliances()));
                  print(id);
                },
                child: Card(
                  color: Colors.purple[200],
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.add_to_home_screen_rounded,
                          size: 40.0,
                          color: Colors.purple[800],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Proceed",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.purple[800],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
