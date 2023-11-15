import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/screens/main_screen/pesanlistview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = [
      'Perjalanan Saya',
      'Bantuan',
      'Tentang Kami',
      'Penawaran',
      'Pengaturan',
      'Riwayat Pemesanan'
    ];

    final user_email = FirebaseAuth.instance.currentUser!;

    Widget alertWidget;
    bool showblur = false;

    return Scaffold(
      backgroundColor: kBGGreyColor,
      appBar: AppBar(
        title: Text('Akun Saya'),
        leading: null,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GFListTile(
              avatar: GFAvatar(
                child: Image.network('https://i.pravatar.cc/300'),
              ),
              titleText: '${user_email.email}',
              subTitleText: 'Lengkapi profil anda',
              icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: menu.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text('${menu[index]}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PesanListView()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GFListTile(
            avatar: Icon(Icons.logout_outlined),
            titleText: 'Logout',
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          // Center(
          //   child: ElevatedButton(
          //     child: Text("Sign Out"),
          //     onPressed: () {
          //       FirebaseAuth.instance.signOut();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
