import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel/pages/homePage.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Receipt extends StatefulWidget {
  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  //Payment variables
  Razorpay razorpay;
  bool paymentDone;

  //random calculation of days

  var app1Day;
  var app2Day;
  var app3Day;
  var app4Day;
  var totalPrice;

  void calculateBill() {
    Random rnd = new Random();

    var min = 1;
    var max = 30;

    var App1Day = min + rnd.nextInt(max - min);
    var App2Day = min + rnd.nextInt(max - min);
    var App3Day = min + rnd.nextInt(max - min);
    var App4Day = min + rnd.nextInt(max - min);

    var App1DayUsage = 50 * App1Day;
    var App2DayUsage = 200 * App2Day;
    var App3DayUsage = 80 * App3Day;
    var App4DayUsage = 100 * App4Day;

    var TotalPrice = App1DayUsage + App2DayUsage + App3DayUsage + App4DayUsage;

    setState(() {
      app1Day = App1Day;
      app2Day = App2Day;
      app3Day = App3Day;
      app4Day = App4Day;
      totalPrice = TotalPrice;
    });
  }

  @override
  void initState() {
    calculateBill();
    super.initState();
    // initializes razorPay
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_4tJOGnreKMYNnM", // test API key
      "amount": num.parse('$totalPrice') *
          100, //converting to number and multiplying to increase decimal value
      "name": "Hotel_owner_A/c",
      "description": "The Total Hotel Bill.",
      "prefill": {
        "contact": "",
        "email": "",
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  handlerPaymentSuccess() {
    print(
      "I am Smart",
    );
    Toast.show("Payment Successful ✔", context, backgroundColor: Colors.green);
    return HomePage();
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => HomePage()));
    paymentDone = true;
  }

  void handlerPaymentError(BuildContext context) {
    print("Payment Failed");
    Toast.show("Payment Failed ✕", context, backgroundColor: Colors.red);
  }

  void handlerExternalWallet() {
    // external wallets like PAYTM
    print("External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: Lottie.asset('assets/billPage.json', height: 150.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Receipt",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "homeAway"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),

                ///
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Appliance',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Usage',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Lights 💡')),
                      DataCell(Text('$app1Day')), // randomize
                      DataCell(Text('₹ 50')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('TV 📺')),
                      DataCell(Text('$app2Day')), // randomize
                      DataCell(Text('₹ 200')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Coffee-Maker ☕')),
                      DataCell(Text('$app3Day')), // randomize
                      DataCell(Text('₹ 80')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Fan 𒅒')),
                      DataCell(Text('$app4Day')), // randomize
                      DataCell(Text('₹ 100')),
                    ]),
                    DataRow(cells: [
                      DataCell(Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                      )),
                      DataCell(Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          " ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                      )), // randomize
                      DataCell(Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          "₹ " + '$totalPrice',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17.0),
                        ),
                      )),
                    ]),
                  ],
                ),

                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    openCheckout();
                    Toast.show("Receipt will be Sent via Email", context,
                        duration: Toast.LENGTH_LONG);
                  },
                  icon: Icon(Icons.point_of_sale_outlined),
                  splashColor: Colors.red,
                  iconSize: 40.0,
                ),
                Text(
                  "PAY",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
