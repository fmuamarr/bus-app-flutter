import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/screens/main_screen/home_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String? to;
  String? from;
  HomeScreen({Key? key, this.to, this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGGreyColor,
      appBar: buildAppBar(),
      body: HomePageBody(
        to: to,
      ),
    );
  }

  AppBar buildAppBar() {
    final user_email = FirebaseAuth.instance.currentUser!;

    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Halo, ${user_email.email!}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined))
      ],
    );
  }
}
