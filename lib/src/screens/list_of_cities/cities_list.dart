import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/screens/main_screen/home_page_screen.dart';
import 'package:client_pemob_app/src/screens/navbar_screen/bottom_navbar.dart';
import 'package:client_pemob_app/src/widgets/destination_view.dart';
import 'package:flutter/material.dart';

class CityList extends StatelessWidget {
  final searchController = TextEditingController();

  final listKotaPopuler = [
    'Bandung',
    'Jakarta',
    'Yogyakarta',
  ];
  final listKota = [
    'Bandung',
    'Jakarta',
    'Jati Asih',
    'Surabaya',
    'Malang',
  ];

  CityList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: kBGGreyColor),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "KOTA POPULER",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listKotaPopuler.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  onTap: () {},
                  title: Text(listKotaPopuler[index]),
                ));
              }),
          Container(
            decoration: BoxDecoration(color: kBGGreyColor),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "KOTA LAINNYA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listKota.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavbar(
                                  to: listKota[index],
                                )));
                  },
                  title: Text(listKota[index]),
                ));
              }),
        ]),
      ),
    );
  }
}
