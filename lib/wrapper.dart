import 'package:asclepio_flutter/pages/login.dart';
import 'package:asclepio_flutter/pages/tabPages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asclepio_flutter/models/user.dart';

class Wrapper extends StatelessWidget { 
  static const routeName = "/wrapper";

  @override
  Widget build(BuildContext context) {
    print('wlcome to WRAPPER');
    final user = Provider.of<User>(context);

    if (user == null) {
      print('login');
      return Login();
    } else {
      print('TabPages');
      return TabPages();
    }
  }
}
