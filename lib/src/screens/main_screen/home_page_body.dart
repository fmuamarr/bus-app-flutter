import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/controller/promo_controller.dart';
import 'package:client_pemob_app/src/widgets/promo_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import "package:velocity_x/velocity_x.dart";

import '../../widgets/destination_view.dart';
import '../../widgets/subheading_with_tbutton.dart';

class HomePageBody extends StatefulWidget {
  String? to;
  HomePageBody({Key? key, this.to}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      // physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          HeaderWithDestinationView(
            size: size,
            to: widget.to,
          ),
          SubTitleWithButton(
            title: "Promo",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PromoView()));
            },
            buttontext: "Selengkapnya",
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("promo").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (!snapshot.hasData) return const Text("No Data");
              final data = snapshot.data!;
              return VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 200,
                  enlargeCenterPage: true,
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    var item = (data.docs[index].data() as Map);
                    item['id'] = data.docs[index].id;
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
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
                          ]),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 180,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
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
                              ]),
                              height: 100,
                              width: 250,
                              child: Image.network(
                                item['image'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${item['title']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Kode: ${item['kode']}'),
                                Text(
                                    'Berlaku sampai tanggal: ${item['tanggal']}'),
                              ],
                            )
                          ]),

                      // child: Row(children: [
                      //   Image.network(item['image']),
                      //   Column(
                      //     children: [Text(item['title']), Text(item['kode'])],
                      //   )
                      // ]),
                    );
                  });
            },
          ),
          SubTitleWithButton(
            title: "Bonus",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PromoView()));
            },
            buttontext: "Selengkapnya",
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("promo").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (!snapshot.hasData) return const Text("No Data");
              final data = snapshot.data!;
              return VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 200,
                  enlargeCenterPage: true,
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    var item = (data.docs[index].data() as Map);
                    item['id'] = data.docs[index].id;
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
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
                          ]),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 180,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
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
                              ]),
                              height: 100,
                              width: 250,
                              child: Image.network(
                                item['image'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${item['title']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Kode: ${item['kode']}'),
                                Text(
                                    'Berlaku sampai tanggal: ${item['tanggal']}'),
                              ],
                            )
                          ]),

                      // child: Row(children: [
                      //   Image.network(item['image']),
                      //   Column(
                      //     children: [Text(item['title']), Text(item['kode'])],
                      //   )
                      // ]),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}

Widget buildCard() {
  return Container(
    width: 200,
    height: 200,
    color: Colors.red,
    child: Column(
      children: [Image.network('https://picsum.photos/id/237/200/300')],
    ),
  );
}
