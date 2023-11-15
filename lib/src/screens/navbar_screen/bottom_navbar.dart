import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/screens/chat_page/chatpage.dart';
import 'package:client_pemob_app/src/screens/main_screen/chat_page.dart';
import 'package:client_pemob_app/src/screens/main_screen/history_page.dart';
import 'package:client_pemob_app/src/screens/main_screen/home_page.dart';
import 'package:client_pemob_app/src/screens/main_screen/home_page_screen.dart';
import 'package:client_pemob_app/src/screens/main_screen/profile_page.dart';
import 'package:client_pemob_app/src/screens/tab_swipe/tab_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  String? to;
  BottomNavbar({Key? key, this.to}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeScreen(
        to: widget.to ?? "",
      ),
      const TabSwipeBar(),
      ChatPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Menu Math',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_outlined),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryColor.withOpacity(0.4),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
