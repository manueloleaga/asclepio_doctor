import 'package:asclepio_flutter/components/TextInput.dart';
import 'package:asclepio_flutter/components/randomClipper.dart';
import 'package:asclepio_flutter/components/registerFormTitle.dart';
import 'package:asclepio_flutter/models/registerUser.dart';
import 'package:asclepio_flutter/pages/login.dart';
import 'package:asclepio_flutter/services/auth.dart';
// import 'package:asclepio_flutter/services/auth.dart';
import 'package:asclepio_flutter/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../wrapper.dart';

class Register extends StatefulWidget {
  static const routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: RandomClipper(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RegisterFormTitle(
                    title: 'Registrate',
                    backUrl: Login.routeName,
                  ),
                  RegisterForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  String error = '';
  RegisterUser _user = new RegisterUser();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: kMainGreenColor.withOpacity(.3),
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
                            setState(() => _user.email = val);
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
                            setState(() => _user.password = val);
                          }),
                    ],
                  ),
                )),
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 50,
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
                    "Registrar",
                    style: TextStyle(
                        color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  dynamic result = await _auth.registerWithEmailAndPassword(_user.email, _user.password);
                  if (result == null) {
                    setState(() => error = 'Introduzca un correo valido');
                  } else {
                    Navigator.pushReplacementNamed(context, Wrapper.routeName);
                  }
                } else {
                  print("NO");
                }
              },
            ),
          ],
        ));
  }
}
