import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/widgets/destination_view.dart';
import 'package:client_pemob_app/src/widgets/promo_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGGreyColor,
      body: Stack(
        children: [
          Positioned(
            top: -325,
            left: -175,
            bottom: 400,
            child: Container(
              width: 750.0,
              height: 625.0,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            right: 15,
            // bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Fadillah Muamar",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 120,
            left: 20,
            right: 20,
            // bottom: 0,
            child: Text(
              "Kemana kamu ingin pergi?",
              style: TextStyle(color: kWhiteColor),
            ),
          ),
          // Positioned(
          //   top: 150,
          //   left: 20,
          //   right: 20,
          //   // bottom: 0,
          //   // child: DestinationView(),
          // ),
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            // bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Promo",
                  style: TextStyle(color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: const Text("Lihat semua"),
                )
              ],
            ),
          ),
          const Positioned(
            top: 480,
            left: 20,
            right: 20,
            // bottom: 0,
            child: PromoView(),
          ),
        ],
      ),
    );
  }
}
