import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/controller/pesancontroller.dart';
import 'package:client_pemob_app/src/screens/main_screen/pesanformview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesanListView extends StatefulWidget {
  PesanListView({Key? key}) : super(key: key);

  @override
  State<PesanListView> createState() => _PesanListViewState();
}

class _PesanListViewState extends State<PesanListView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PesanFormController>(
        init: PesanFormController(),
        builder: (controller) {
          controller.view = PesanFormView();

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "List Jadwal",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: kBGGreyColor,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => PesanFormView())));
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.black,
            ),
            body: Container(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
              child: Column(children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("pesan")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text("Error");
                        if (!snapshot.hasData) return Text("No Data");
                        final data = snapshot.data!;
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            var item = (data.docs[index].data() as Map);
                            item['id'] = data.docs[index].id;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PesanFormView(
                                              item: item,
                                            )));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    backgroundImage: AssetImage(
                                        "assets/images/logo_black.png"),
                                  ),
                                  title: Text(item['pesan_tanggal']),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () =>
                                        controller.delete(item['id']),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                )
              ]),
            )),
          );
        });
  }
}
