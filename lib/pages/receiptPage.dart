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
  Razorpay razorpay;
  bool paymentDone;

  @override
  void initState() {
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
      "amount": num.parse(
          '1000'), //converting to number and multiplying to increase decimal value
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
                  height: 360.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    openCheckout();
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
