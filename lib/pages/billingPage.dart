import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel/components/bottomNavbarconfig.dart';
import 'homePage.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class billingPage extends StatefulWidget {
  @override
  _billingPageState createState() => _billingPageState();
}

class _billingPageState extends State<billingPage> {
  Razorpay razorpay;
  TextEditingController amountController = new TextEditingController();
  String getvalue;
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
      "amount": num.parse(amountController.text) *
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
    // print(
    //   "I am Smart",
    // );
    // Toast.show("Payment Successful ✔", context, backgroundColor: Colors.green);
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
    if (paymentDone == true) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => HomePage()));
    }

    return Scaffold(
      bottomNavigationBar: BottomNavConfig(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 70.0,
              ),
              Lottie.asset('assets/billing.json', height: 175.0),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "PAYMENT",
                style: TextStyle(fontSize: 60, fontFamily: "homeAway"),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Enter Amount to be paid:",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // prefix: Icon(Icons.payment),
                    decoration: InputDecoration(
                      hintText: "₹",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.payments_outlined),
                    ),

                    controller: amountController,
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  child: Text("Proceed"),
                  onPressed: () {
                    setState(() {
                      getvalue = amountController.text;
                    });
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 15,
                            child: Container(
                              height: 300.0,
                              width: 400.0,
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.warning,
                                      size: 30.0,
                                      color: CupertinoColors.systemYellow,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Center(
                                    child: Text(
                                      "Please verify the Amount",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Center(
                                      child: Text(
                                    "₹ " + '$getvalue',
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CupertinoButton(
                                        color: CupertinoColors.activeBlue,
                                        child: Text("Yes, I wish to Proceed"),
                                        onPressed: () {
                                          openCheckout();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        }),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  "Totally Secured Payment By 'RazorPay'",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
