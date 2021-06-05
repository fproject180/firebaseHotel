import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

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
        TabItem(icon: Icons.map, title: 'Discovery'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.message, title: 'Message'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: 2,
    );
  }
}
