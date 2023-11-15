import 'package:client_pemob_app/src/screens/main_screen/pesanformview.dart';
import 'package:client_pemob_app/src/screens/main_screen/pesanlistview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../widget/textfield.dart';

class PesanFormController extends GetxController {
  PesanFormView? view;
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
      var id_jadwal = Input.get("id_jadwal");
      var pesan_tanggal = Input.get("pesan_tanggal");

      await FirebaseFirestore.instance
          .collection("pesan")
          .add({"id_jadwal": id_jadwal, "pesan_tanggal": pesan_tanggal});
      Get.back();
    } else if (id != null) {
      var id_jadwal = Input.get("id_jadwal");
      var pesan_tanggal = Input.get("pesan_tanggal");

      await FirebaseFirestore.instance
          .collection("pesan")
          .doc(id)
          .update({"id_jadwal": id_jadwal, "pesan_tanggal": pesan_tanggal});
      Get.back();
    }
  }

  delete(id) async {
    await FirebaseFirestore.instance.collection("pesan").doc(id).delete();
  }
}
