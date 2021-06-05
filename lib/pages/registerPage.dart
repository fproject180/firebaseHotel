import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel/pages/homePage.dart';
import 'package:hotel/pages/loginPage.dart';
import 'package:hotel/services/authService.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthenticationService _authenticationService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Image(image: AssetImage("assets/register.png")),
              ),
              Text(
                "Regsiter",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email...";
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: "Email",
                        hintText: "example@example.com"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty || value.length < 6) {
                        return "Password should be 6+ chars long";
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Password",
                        hintText: "Password123"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('User Registered')));
                      userRegister();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        minimumSize: Size(double.infinity, 40.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Login"),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        minimumSize: Size(double.infinity, 40.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void userRegister() async {
    await context
        .read<AuthenticationService>()
        .signUp(email: emailController.text, password: passwordController.text);
  }
}
