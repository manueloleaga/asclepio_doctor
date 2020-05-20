import 'package:asclepio_flutter/pages/chat.dart';
import 'package:asclepio_flutter/pages/profile.dart';
import 'package:asclepio_flutter/pages/home.dart';
import 'package:asclepio_flutter/utilities/constant.dart';
import 'package:flutter/material.dart';

class TabPages extends StatefulWidget {
  static const routeName = "home";
  @override
  _TabPagesState createState() => _TabPagesState();
}

class _TabPagesState extends State<TabPages> {
  //Properties
  int currentTab = 0;
  final List<Widget> screens = [
    Chat(),
    Profile(),
    Home(),
  ];

  //Active Page (tab)
  Widget currentScreen = Chat();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Chatbtn
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = Chat();
                      currentTab = 0;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.chat,
                      color: currentTab == 0 ? kMainGreenColor : Colors.grey,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                        color: currentTab == 0 ? kMainGreenColor : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),

              //Homebtn
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = Home();
                      currentTab = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: currentTab == 1 ? kMainGreenColor : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: currentTab == 1 ? kMainGreenColor : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),

              //Profilebtn
              MaterialButton(
                minWidth: 80,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = Profile();
                      currentTab = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: currentTab == 2 ? kMainGreenColor : Colors.grey,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: currentTab == 2 ? kMainGreenColor : Colors.grey,
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
