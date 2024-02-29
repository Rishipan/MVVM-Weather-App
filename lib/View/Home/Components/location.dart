import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.getAddress(),
                style: const TextStyle(
                  height: 0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              // Text(
              //   Utilities.formateDate(DateTime.now()),
              //   style: TextStyle(
              //     color: Colors.grey.withOpacity(.7),
              //     fontWeight: FontWeight.bold,
              //   ),
              // )
            ],
          ),
          // const Spacer(),
          // SizedBox(
          //   height: 120,
          //   width: 120,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Image.asset(
          //         ImageAssets.map,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
