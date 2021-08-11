import 'package:app_shamo/pages/home/chat_page.dart';
import 'package:app_shamo/pages/home/home_page.dart';
import 'package:app_shamo/pages/home/profile_page.dart';
import 'package:app_shamo/pages/home/wishlist_page.dart';
import 'package:app_shamo/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cardButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/choose-weight');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          "assets/icon_nav_cart.png",
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              backgroundColor: bgColor4,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: Image.asset(
                          'assets/icon_nav_home.png',
                          width: 20,
                          color: currentIndex == 0
                              ? primaryColor
                              : Color(0xff808191),
                        )),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: Image.asset(
                          'assets/icon_nav_chat.png',
                          width: 20,
                          color: currentIndex == 1
                              ? primaryColor
                              : Color(0xff808191),
                        )),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: Image.asset(
                          'assets/icon_nav_wishlist.png',
                          width: 20,
                          color: currentIndex == 2
                              ? primaryColor
                              : Color(0xff808191),
                        )),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: Image.asset(
                          'assets/icon_nav_profile.png',
                          width: 20,
                          color: currentIndex == 3
                              ? primaryColor
                              : Color(0xff808191),
                        )),
                    label: '')
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cardButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: Center(
        child: body(),
      ),
    );
  }
}
