// ignore_for_file: depend_on_referenced_packages, unused_import, unnecessary_overrides

import 'package:client_pemob_app/src/widgets/input_widget.dart';
import 'package:client_pemob_app/src/widgets/promo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoController extends GetxController {
  PromoView? view;
  String search = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  save() async {
    var id = Input.get("id");
    if (id == null) {
      var image = Input.get("image");
      var kode = Input.get("kode");
      var tanggal = Input.get("tanggal");
      var title = Input.get("title");

      await FirebaseFirestore.instance.collection("promo").add(
          {"image": image, "kode": kode, "tanggal": tanggal, "title": title});
      Get.back();
    } else if (id != null) {
      var image = Input.get("image");
      var kode = Input.get("kode");
      var tanggal = Input.get("tanggal");
      var title = Input.get("title");

      await FirebaseFirestore.instance.collection("promo").doc(id).update(
          {"image": image, "kode": kode, "tanggal": tanggal, "title": title});
      Get.back();
    }
  }

  delete(id) async {
    await FirebaseFirestore.instance.collection("promo").doc(id).delete();
  }
}
