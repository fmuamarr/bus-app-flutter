import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/controller/pesancontroller.dart';
import 'package:client_pemob_app/src/widget/button.dart';
import 'package:client_pemob_app/src/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesanFormView extends StatefulWidget {
  String? id;
  final Map? item;
  PesanFormView({Key? key, this.item, this.id}) : super(key: key);

  @override
  State<PesanFormView> createState() => _PesanFormViewState();
}

class _PesanFormViewState extends State<PesanFormView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PesanFormController>(
        init: PesanFormController(),
        builder: (controller) {
          controller.view = PesanFormView();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kBGGreyColor,
              title: Text(
                "Form Pemesanan",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                ExButton(
                  onPressed: () => controller.save(),
                  label: "Save",
                  width: 80,
                  color: Colors.black,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  ExTextField(
                    id: "id",
                    label: "Id",
                    value: widget.item == null ? null : widget.item!['id'],
                    enabled: false,
                  ),
                  ExTextField(
                      id: "id_jadwal",
                      label: "ID Jadwal",
                      value: widget.item == null
                          ? widget.id
                          : widget.item!['id_jadwal']),
                  ExTextField(
                      id: "pesan_tanggal",
                      label: "Tanggal Pemesanan",
                      value: widget.item == null
                          ? null
                          : widget.item!['pesan_tanggal']),
                ]),
              ),
            ),
          );
        });
  }
}
