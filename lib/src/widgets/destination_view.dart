import 'package:client_pemob_app/src/screens/list_of_cities/cities_list.dart';
import 'package:client_pemob_app/src/screens/main_screen/list_of_schedule.dart';
import 'package:client_pemob_app/src/screens/main_screen/promo_view_page.dart';
import 'package:client_pemob_app/src/widgets/promo_view.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HeaderWithDestinationView extends StatefulWidget {
  String? from;
  String? to;

  HeaderWithDestinationView({
    Key? key,
    required this.size,
    this.from,
    this.to,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderWithDestinationView> createState() =>
      _HeaderWithDestinationViewState();
}

class _HeaderWithDestinationViewState extends State<HeaderWithDestinationView> {
  TextEditingController? tujuanController;
  TextEditingController? dariController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tujuanController = new TextEditingController(text: widget.from ?? " ");
    dariController = new TextEditingController(text: widget.to ?? " ");
  }

  @override
  Widget build(BuildContext context) {
    //
    void _showDateTimePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2025),
      );
    }

    return Container(
      height: widget.size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.2 + 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            left: 20,
            child: Text(
              "Kemana kamu ingin pergi?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Positioned(
            top: 50,
            // bottom: 0,
            right: 10,
            left: 10,
            child: Container(
              height: 270,
              width: 350,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
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
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_city_outlined),
                          color: kPalleteColor,
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CityList()));
                            },
                            child: IgnorePointer(
                              child: TextField(
                                controller: dariController,
                                decoration: InputDecoration(
                                  labelText: 'From',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Divider(thickness: 0.1, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on_outlined),
                          color: kPalleteColor,
                        ),
                        Flexible(
                          child: TextField(
                            controller: tujuanController,
                            decoration: InputDecoration(
                              labelText: 'To',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Divider(thickness: 0.2, color: Colors.black),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.date_range_outlined),
                          color: kPalleteColor,
                        ),
                        Flexible(
                          child: TextField(
                            onTap: _showDateTimePicker,
                            decoration: InputDecoration(
                              // labelText: 'To',
                              // floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 20,
                      bottom: 0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        minimumSize: Size.fromHeight(40),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JadwalListView(
                                      to: tujuanController!.text,
                                      from: dariController!.text,
                                    )));
                      },
                      child: Text("SEARCH"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
