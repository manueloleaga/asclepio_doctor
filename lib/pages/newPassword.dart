import 'package:asclepio_flutter/components/TextInput.dart';
import 'package:asclepio_flutter/components/randomClipper.dart';
import 'package:asclepio_flutter/components/registerFormTitle.dart';
import 'package:asclepio_flutter/pages/login.dart';
import 'package:asclepio_flutter/services/auth.dart';
import 'package:asclepio_flutter/utilities/constant.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  static const routeName = "/newPassword";
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                    title: 'Nueva Contraseña',
                    backUrl: Login.routeName,
                  ),
                  NewPasswordForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewPasswordForm extends StatefulWidget {
  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  String email = '';
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
                    color: kMainGreenColor.withOpacity(.1),
                    blurRadius: 20.0,
                    offset: Offset(0, 10)
                  )
                ]
              ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      RoundedInput(
                        labelText: "Email",
                        obscureText: false,
                        validatiorFunc: (validator) => validator.isEmpty ? 'Ingrese el correo' : null,
                        onChangedFunc: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
                    "Enviar",
                    style: TextStyle(
                        color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  dynamic result = await _auth.sendPasswordResertEmail(email);
                  if (result != null) {
                    Navigator.pushReplacementNamed(context, Login.routeName);
                  }
                }
              },
            ),
        ],
      ),
    );
  }
}