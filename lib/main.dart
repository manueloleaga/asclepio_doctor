import 'package:asclepio_flutter/models/user.dart';
import 'package:asclepio_flutter/pages/login.dart';
import 'package:asclepio_flutter/pages/newPassword.dart';
import 'package:asclepio_flutter/pages/register.dart';
import 'package:asclepio_flutter/pages/tabPages.dart';
import 'package:asclepio_flutter/services/auth.dart';
import 'package:asclepio_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo', 
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: Wrapper(),
        initialRoute: Wrapper.routeName,
        routes: {
          TabPages.routeName: (context) => SafeAreaViewer(child: TabPages(),),
          Register.routeName: (context) => SafeAreaViewer(child: Register(),),
          Login.routeName: (context) => SafeAreaViewer(child: Login(),),
          Wrapper.routeName: (context) => SafeAreaViewer(child: Wrapper(),),
          NewPassword.routeName: (context) => SafeAreaViewer(child: NewPassword(),),
        }
      ),
    );
  }
}

class SafeAreaViewer extends StatelessWidget {
  SafeAreaViewer({@required this.child});
  final child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: true, bottom: true, child: child);
  }
}
