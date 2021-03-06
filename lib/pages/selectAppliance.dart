import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class SelectAppliance extends StatefulWidget {
  @override
  _SelectApplianceState createState() => _SelectApplianceState();
}

class _SelectApplianceState extends State<SelectAppliance> {
  bool Lights = false;
  Color _acColor = Colors.black;
  Color _lightColor = Colors.black;
  Color _cafeColor = Colors.black;
  Color _tvColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("HotelInfo").snapshots(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                  child: Container(
                // color: Colors.black,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.0,
                    ),
                    Center(
                      child: Lottie.asset(
                        "assets/appliance.json",
                        height: 230.0,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Select Appliances",
                      style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.ac_unit_outlined),
                                color: _acColor,
                                onPressed: () {
                                  setState(() {
                                    if (_acColor == Colors.black) {
                                      _acColor = Colors.yellow;
                                    } else {
                                      _acColor = Colors.black;
                                    }
                                  });
                                },
                                iconSize: 70.0,
                              ),
                              Text("AC"),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                            width: 80.0,
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.lightbulb_outline),
                                color: _lightColor,
                                onPressed: () {
                                  setState(() {
                                    if (_lightColor == Colors.black) {
                                      _lightColor = Colors.yellow;
                                    } else {
                                      _lightColor = Colors.black;
                                    }
                                  });
                                },
                                iconSize: 70.0,
                              ),
                              Text("Lights"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.local_cafe_outlined),
                                color: _cafeColor,
                                onPressed: () async {
                                  FirebaseFirestore.instance
                                      .collection("HotelInfo")
                                      .doc('4gjlA3Tzp4TVSKGmng8V')
                                      .update({"HotelAppliance": true});

                                  setState(() {
                                    if (_cafeColor == Colors.black) {
                                      _cafeColor = Colors.yellow;
                                    } else {
                                      _cafeColor = Colors.black;
                                    }
                                  });
                                },
                                iconSize: 70.0,
                              ),
                              Text("Coffee-Maker"),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                            width: 80.0,
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.live_tv_outlined),
                                color: _tvColor,
                                onPressed: () async {
                                  setState(() {
                                    if (_tvColor == Colors.black) {
                                      _tvColor = Colors.yellow;
                                    } else {
                                      _tvColor = Colors.black;
                                    }
                                  });
                                },
                                iconSize: 70.0,
                              ),
                              Text("Television"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "*Appliances are not inclusive of Basic charges",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                      child: CupertinoButton(
                          child: Text("Select"),
                          color: CupertinoColors.activeBlue,
                          onPressed: () {
                            // setState(() {});
                            // showCupertinoDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return Dialog(
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(30.0)),
                            //         elevation: 15,
                            //         child: Container(
                            //           height: 700.0,
                            //           width: 600.0,
                            //           child: ListView(
                            //             children: [
                            //               SizedBox(
                            //                 height: 3.0,
                            //               ),
                            //               Center(
                            //                 child: Text(
                            //                   "Confirmation!",
                            //                   style: TextStyle(fontSize: 25.0),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     });

                            // Navigator.of(context).push(CupertinoPageRoute(
                            //     builder: (context) => bookingConfirmationPage()));
                          }),
                    )
                  ],
                ),
              ));
            }));
  }
}
