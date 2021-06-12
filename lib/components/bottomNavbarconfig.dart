import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/pages/billingPage.dart';
import 'package:hotel/pages/ratingPage.dart';
import 'package:hotel/pages/servicesPage.dart';

class BottomNavConfig extends StatefulWidget {
  @override
  _BottomNavConfigState createState() => _BottomNavConfigState();
}

class _BottomNavConfigState extends State<BottomNavConfig> {
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.purple[400],
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.list, title: 'List'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.star_rate_outlined, title: 'Rate Us'),
        TabItem(icon: Icons.payments_outlined, title: 'Payment'),
      ],
      initialActiveIndex: 2,
      onTap: (index) {
        if (index == 1) {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => ServicesPage()));
        }
        if (index == 3) {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => RatingPage()));
        }
        if (index == 4) {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => billingPage()));
        }
      },
    );
  }
}
