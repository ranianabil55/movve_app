import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movve_app/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String pass = '123456';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                      // width: double.infinity,
                      //height: double.infinity,
                      child: Lottie.asset(
                    'assets/lottie/logoo.json',
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your E-mail';
                    } else if (value != 'Rania') {
                      return 'Enter Valid E-mail';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your  password';
                    } else if (value != pass) {
                      return 'Wrong password';
                    } else
                      return null;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Color(0xFF8C1F0F),
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomePage()),
                      //   );
                      // }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
