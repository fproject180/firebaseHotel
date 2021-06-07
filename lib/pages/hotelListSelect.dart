import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HotelSelect extends StatefulWidget {
  @override
  _HotelSelectState createState() => _HotelSelectState();
}

class _HotelSelectState extends State<HotelSelect> {
  var hotelName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[400],
        appBar: AppBar(
            elevation: 0.0,
            bottomOpacity: 0.0,
            title: Text('Select hotel list'),
            centerTitle: true,
            backgroundColor: Colors.purple[400]),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('HotelInfo').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data.docs.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(),
                        child: Card(
                          child: ListTile(
                            title: Text(e['HotelName']),
                            subtitle: Text(e['HotelCity']),
                            leading: Radio(
                                value: e['HotelName'],
                                onChanged: (value) {
                                  Navigator.pop(context, value);
                                  print(e);
                                }),
                          ),
                        )),
                  );
                }).toList(),
              );
            }));
  }
}
