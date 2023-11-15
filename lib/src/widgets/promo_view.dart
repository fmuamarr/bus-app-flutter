import 'package:client_pemob_app/src/constants/colors.dart';
import 'package:client_pemob_app/src/controller/promo_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PromoView extends StatelessWidget {
  const PromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromoController>(
        init: PromoController(),
        builder: (controller) {
          controller.view = const PromoView();
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            color: kPalleteColor,
                            child: Center(
                              child: Text('Card $index'),
                            ),
                          )),
                ),
              ],
            ),
          );
        });
  }
}
