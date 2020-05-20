import 'package:asclepio_flutter/pages/newPassword.dart';
import 'package:asclepio_flutter/pages/register.dart';
import 'package:flutter/material.dart';

class LoginReristerForgotPassword extends StatelessWidget {
  final commontextStyle =
      TextStyle(fontSize: 20, decoration: TextDecoration.underline);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              child: Text(
                "Restaurar contraseña",
                style: commontextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(NewPassword.routeName);
              },
            )),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Registrate",
              style: commontextStyle,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Register.routeName);

            print("registrate");
          },
        ),
      ],
    );
  }
}
