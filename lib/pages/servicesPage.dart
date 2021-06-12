import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 70.0,
              ),
              Center(
                child: Lottie.asset(
                  "assets/services.json",
                  height: 230.0,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Services",
                style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
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
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.purple[200],
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
                                child: IconButton(
                                  onPressed: () {
                                    Toast.show(
                                      "Dry Cleaning Service on its way",
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                    );
                                  },
                                  icon: Icon(Icons.dry_cleaning_outlined,
                                      size: 35.0,
                                      color: Colors.purpleAccent[800]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Dry Cleaning",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue[900],
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
                                child: IconButton(
                                  onPressed: () {
                                    Toast.show("INCOMING!! Yummy Food", context,
                                        duration: Toast.LENGTH_LONG);
                                  },
                                  icon: Icon(Icons.restaurant_outlined,
                                      size: 33.0, color: Colors.green[800]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Food",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.green[800],
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
                      color: Colors.greenAccent[200],
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
                                child: IconButton(
                                  onPressed: () {
                                    Toast.show(
                                      "Approaching Taxi.",
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                    );
                                  },
                                  icon: Icon(Icons.local_taxi_outlined,
                                      size: 35.0, color: Colors.yellow[800]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Cab",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.yellow[900],
                                    fontWeight: FontWeight.bold),
                              ),
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
                      color: Colors.yellowAccent[400],
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
                                child: IconButton(
                                  onPressed: () {
                                    Toast.show(
                                      "Maintenance Crew will arrive shortly",
                                      context,
                                      duration: Toast.LENGTH_LONG,
                                    );
                                  },
                                  icon: Icon(Icons.engineering_outlined,
                                      size: 35.0, color: Colors.yellow[800]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Maintenance",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue,
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
      ),
    );
  }
}
