import 'package:asclepio_flutter/services/auth.dart';
import 'package:asclepio_flutter/utilities/constant.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = new AuthService(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: kMainGreenColor,
      ),
      body: InkWell(
        child: Text(
          "Logout",
        ),
        onTap: () {
          _auth.signOut();
        },
      ),
    );
  }
}