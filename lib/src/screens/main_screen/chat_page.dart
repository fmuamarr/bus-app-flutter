import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/screens/chat_page/chatpage.dart';
import 'package:client_pemob_app/src/widgets/subheading_with_tbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGGreyColor,
      appBar: AppBar(
        title: Text("Sobat MariBUS"),
        actions: [
          GFButton(
            onPressed: () {},
            text: "Bahasa",
            textColor: Colors.white,
            icon: Icon(Icons.language_outlined),
            color: Colors.transparent,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SubTitleWithButton(title: "FAQs", press: () {}, buttontext: ''),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     height: 70,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Image.asset(
          //             'assets/images/logo_black.png',
          //             height: 60.0,
          //             width: 60.0,
          //           ),
          //           Text("Tiket bus"),
          //           Icon(Icons.arrow_forward_ios_outlined),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
          Container(
            alignment: Alignment.center,
            child: GFListTile(
              avatar: Image.asset(
                'assets/images/logo_black.png',
                height: 60,
                width: 60,
              ),
              titleText: 'Tiket bus',
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
          SubTitleWithButton(title: "Topik lain", press: () {}, buttontext: ''),
          GFListTile(
            avatar: Icon(
              Icons.question_answer_outlined,
              color: Colors.red[300],
            ),
            titleText: 'Bantuan chat dengan admin',
            subTitleText: 'Hubungi admin jika memiliki kendala.',
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChattingPage(email: 'fadillahmuamar@gmail.com'),
                ),
              );
            },
          ),
          GFListTile(
            avatar: Icon(
              Icons.car_crash_outlined,
              color: Colors.red[300],
            ),
            titleText: 'Bantuan Pemesanan Bus',
            subTitleText: 'Temukan cara memesan tiket dan lain-lain.',
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            onTap: () {},
          ),
          GFListTile(
            avatar: Icon(
              Icons.stars_sharp,
              color: Colors.red[300],
            ),
            titleText: 'Penawaran',
            subTitleText: 'Dapatkan penawaran menarik dari kami.',
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
