import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/controller/controller.dart';
import 'package:client_pemob_app/src/screens/main_screen/jadwal_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';

class JadwalListView extends StatefulWidget {
  String? to;
  String? from;
  JadwalListView({Key? key, this.to, this.from});

  @override
  State<JadwalListView> createState() => _JadwalListViewState();
}

class _JadwalListViewState extends State<JadwalListView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JadwalController>(
        init: JadwalController(),
        builder: (controller) {
          controller.view = JadwalListView();
          return Scaffold(
              backgroundColor: kBGGreyColor,
              appBar:
                  AppBar(title: Text('Jadwal ${widget.to} - ${widget.from}')),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                child: Column(
                  children: [
                    Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("jadwal")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (!snapshot.hasData) return const Text("No Data");
                        final data = snapshot.data!;
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.docs.length,
                            itemBuilder: (context, index) {
                              var item = (data.docs[index].data() as Map);
                              item['id'] = data.docs[index].id;
                              if (widget.to!.isNotEmpty) {
                                if (!item["jadwal_keberangkatan"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(widget.from!.toLowerCase()) &&
                                    !item["jadwal_tujuan"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(widget.to!.toLowerCase())) {
                                  return Container();
                                }
                              } else {
                                Center(
                                  child: Text(
                                      "Data Kosong atau jadwal tidak ditemukan"),
                                );
                              }
                              return Card(
                                child: GFListTile(
                                  avatar: Image.network(
                                    item['jadwal_image'],
                                    width: 70,
                                    height: 70,
                                  ),
                                  titleText: '${item['jadwal_bus']}',

                                  subTitleText:
                                      '${item['jadwal_keberangkatan']} - ${item['jadwal_tujuan']} \nKeberangkatan: ${item['jadwal_tanggal']}, ${item['jadwal_jam']} ',

                                  icon: Icon(Icons.details, color: Colors.grey),
                                  margin: EdgeInsets.all(5.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => JadwalDetail(
                                                  id: item['id'],
                                                  bus: item['jadwal_bus'],
                                                  image: item['jadwal_image'],
                                                  jam: item['jadwal_jam'],
                                                  keberangkatan: item[
                                                      'jadwal_keberangkatan'],
                                                  seats: item['jadwal_seats'],
                                                  tanggal:
                                                      item['jadwal_tanggal'],
                                                  tujuan: item['jadwal_tujuan'],
                                                )));
                                  },
                                  // leading: CircleAvatar(
                                  //   backgroundColor: Colors.grey.shade200,
                                  //   backgroundImage:
                                  //       NetworkImage(item['jadwal_image']),
                                  // ),
                                  // title: Text(item['jadwal_bus']),
                                  // subtitle: Text(item['jadwal_keberangkatan'] +
                                  //     " - " +
                                  //     item['jadwal_tujuan']),
                                  // trailing: IconButton(
                                  //   icon: const Icon(Icons.delete),
                                  //   onPressed: () =>
                                  //       controller.delete(item['id']),
                                  // ),
                                ),
                              );
                            });
                      },
                    ))
                  ],
                ),
              ));
        });
  }
}
