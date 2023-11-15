import 'package:client_pemob_app/src/screens/main_screen/pesanformview.dart';
import 'package:flutter/material.dart';

class JadwalDetail extends StatelessWidget {
  final id;
  final bus;
  final image;
  final jam;
  final keberangkatan;
  final seats;
  final tanggal;
  final tujuan;

  JadwalDetail(
      {this.id,
      this.bus,
      this.image,
      this.jam,
      this.keberangkatan,
      this.seats,
      this.tanggal,
      this.tujuan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          image != null
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$keberangkatan - $tujuan",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "$bus",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 5),
                Text("Seats tersedia: $seats"),
                const Divider(),
                Text("Tanggal: $tanggal"),
                Text("Jam: $jam"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanFormView(id: id)));
                    },
                    child: Text('Pesan'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
