import 'package:asclepio_flutter/components/TextInput.dart';
import 'package:asclepio_flutter/components/imageDecoration.dart';
import 'package:asclepio_flutter/components/loginReristerForgotPassword.dart';
import 'package:asclepio_flutter/services/auth.dart';
import 'package:asclepio_flutter/utilities/constant.dart';
import 'package:asclepio_flutter/wrapper.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ImageDecoration(imageUrl: 'assets/images/Doctors.png'),
          ),
          Expanded(
            flex: 2,
            child: LoginForm(),
          ),
          Expanded(
            child: LoginReristerForgotPassword(),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 25),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: kMainGreenColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 25),
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: kMainGreenColor.withOpacity(.4),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Container(
                    child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      RoundedInput(
                          labelText: "Email",
                          obscureText: false,
                          validatiorFunc: (validator) {
                            return validator.isEmpty
                                ? 'Ingrese el correo'
                                : null;
                          },
                          onChangedFunc: (val) {
                            setState(() => email = val);
                          }),
                      RoundedInput(
                          labelText: "Password",
                          obscureText: true,
                          validatiorFunc: (validator) {
                            return validator.isEmpty
                                ? 'Ingrese la constraseña'
                                : null;
                          },
                          onChangedFunc: (val) {
                            setState(() => password = val);
                          }),
                    ],
                  ),
                )),
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height:50,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    kMainGreenColor.withOpacity(1),
                    kMainGreenColor.withOpacity(.6)
                  ]),
                ),
                child: Center(
                  child: Text(
                    "Ingresar",
                    style: TextStyle(
                        color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onPressed: () async {
                print("Here");
                if (formKey.currentState.validate()) {
                  dynamic result =
                      await _auth.signInWithEmailAndPassword(email, password);
                  if (result != null) {
                    Navigator.pushReplacementNamed(context, Wrapper.routeName);
                  }
                }
              },
            ),
          ],
        ));
  }
}
