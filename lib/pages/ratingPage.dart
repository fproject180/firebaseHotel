import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:hotel/pages/homePage.dart';
import 'package:toast/toast.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  var rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Image.asset('assets/Rating.gif', height: 200.0),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Rate Us",
              style: TextStyle(
                  fontSize: 60,
                  fontFamily: "homeAway",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Show us your Love",
              style: TextStyle(fontSize: 50.0, fontFamily: "homeAway"),
            ),
            SizedBox(
              height: 50.0,
            ),
            RatingBar(
              alignment: Alignment.center,
              filledIcon: Icons.favorite,
              filledColor: Colors.red,
              emptyColor: Colors.redAccent,
              emptyIcon: Icons.favorite_border,
              onRatingChanged: (value) {
                if (value == 1) {
                  setState(() {
                    rating = "Hate It";
                  });
                }
                if (value == 2) {
                  setState(() {
                    rating = "Its Bad";
                  });
                }
                if (value == 3) {
                  setState(() {
                    rating = "Its OK ";
                  });
                  print(rating);
                }
                if (value == 4) {
                  setState(() {
                    rating = "Like It";
                  });
                }
                if (value == 5) {
                  setState(() {
                    rating = "Love It";
                  });
                }
              },
              initialRating: 0,
              maxRating: 5,
              size: 50.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              rating == null ? "Tap to Rate" : rating,
              style: TextStyle(fontFamily: "pacifico", fontSize: 25.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            CupertinoButton(
              child: Text("Submit"),
              onPressed: () {
                Toast.show("Thank You for Rating!", context,
                    duration: Toast.LENGTH_LONG);
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => HomePage()));
              },
              color: CupertinoColors.activeGreen,
            )
          ],
        ),
      ),
    ));
  }
}
