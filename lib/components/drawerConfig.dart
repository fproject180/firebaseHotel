import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/pages/loginPage.dart';
import 'package:hotel/services/authService.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';

class DrawerConfig extends StatefulWidget {
  @override
  _DrawerConfigState createState() => _DrawerConfigState();
}

class _DrawerConfigState extends State<DrawerConfig> {
  var userId;
  var emailId;

  @override
  void initState() {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser;
    final uid = user.uid;
    final email = user.email;
    print(uid);
    setState(() {
      userId = uid;
      emailId = email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
      child: Drawer(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/avatar.png"))),
                  ),
                  Text(
                    "$emailId",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: Icon(
              Icons.settings,
              color: CupertinoColors.darkBackgroundGray,
            ),
            onTap: () {},
          ),
          ListTile(
              title: Text(
                "About Us",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.person,
                color: CupertinoColors.activeOrange,
              )),
          ListTile(
              title: Text(
                "More Info",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.info,
                color: CupertinoColors.activeBlue,
              )),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                onTap: () {
                  context.read<AuthenticationService>().signOut();
                  Navigator.of(context).pop();
                  Toast.show("Signed Out", context,
                      duration: Toast.LENGTH_LONG);
                  Navigator.of(context, rootNavigator: true).pop();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginPage()));
                },
                title: Text(
                  "logout",
                  style: TextStyle(
                      fontSize: 20.0, color: CupertinoColors.systemRed),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: CupertinoColors.systemRed,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
