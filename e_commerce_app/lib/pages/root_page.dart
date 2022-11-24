import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '/pages/dashboard_page.dart';
import '/theme/color.dart';
import 'package:flutter/material.dart';


class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        bottomNavigationBar: getFooter(),
        body: getBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            backgroundColor: primary,
            child: const Icon(
              Icons.credit_card_outlined,
              size: 25,
            )
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DashbaordPage(),
        Center(
          child: Text("Chat Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Notification Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Account Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Card Page",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.view_agenda,
      Icons.comment,
      Icons.border_all,
      Icons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}