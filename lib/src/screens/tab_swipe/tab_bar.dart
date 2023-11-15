import 'package:client_pemob_app/src/screens/main_screen/history_page.dart';
import 'package:client_pemob_app/src/screens/main_screen/list_of_schedule.dart';
import 'package:client_pemob_app/src/screens/main_screen/promo_view_page.dart';
import 'package:flutter/material.dart';

class TabSwipeBar extends StatefulWidget {
  const TabSwipeBar({super.key});

  @override
  State<TabSwipeBar> createState() => _TabSwipeBarState();
}

class _TabSwipeBarState extends State<TabSwipeBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reports'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: "Today's News", icon: Icon(Icons.tab)),
            // Tab(text: 'Tab 2', icon: Icon(Icons.tab)),
            Tab(text: "Daftar Promo", icon: Icon(Icons.discount_outlined)),
          ]),
        ),
        body: TabBarView(children: [
          HistoryPage(),
          // JadwalListView(),
          PromoPage(),
        ]),
      ),
    );
  }
}
