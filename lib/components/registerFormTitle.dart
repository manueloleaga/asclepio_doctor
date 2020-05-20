import 'package:flutter/material.dart';

class RegisterFormTitle extends StatelessWidget {
  final String title;
  final String backUrl;
  
  RegisterFormTitle({@required this.title, @required this.backUrl});
  final headerStyle =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800);
  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.title,
            style: headerStyle,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.backUrl);
            },
            child: Text(
              "X",
              style: headerStyle,
            ),
          ),
        ],
      ),
    );
  }
}