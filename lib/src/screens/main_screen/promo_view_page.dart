import 'package:client_pemob_app/src/controller/promo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromoController>(
        init: PromoController(),
        builder: (controller) {
          // controller.view = PromoPage();
          return Scaffold(
              appBar: AppBar(title: const Text('Promo untukmu')),
              body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
                child: Column(
                  children: [
                    Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("promo")
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
                              if (controller.search.isNotEmpty) {
                                if (!item["jadwal_bus"]
                                    .toString()
                                    .toLowerCase()
                                    .contains(controller.search)) {
                                  return Container();
                                }
                              }
                              return Card(
                                child: GFListTile(
                                  avatar: Image.network(
                                    item['image'],
                                    width: 70,
                                    height: 70,
                                  ),
                                  titleText: '${item['title']}',
                                  subTitleText:
                                      'Kode :${item['kode']}\nBerlaku sampai: ${item['tanggal']}\n*Syarat dan ketentuan berlaku.',
                                  icon: Icon(Icons.details, color: Colors.grey),
                                  margin: EdgeInsets.all(5.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
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
