import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/images/image_assets.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Components/tile.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/days_controller.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class SmallBoxList extends StatelessWidget {
  SmallBoxList({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Spacer(),
        const SizedBox(width: 20),
        Obx(
          () => MyTile(
              text: '${controller.day.value.precipprob.toInt().toString()}%',
              image: ImageAssets.storm,
              color: Colors.white38,
              textColor: Colors.white),
        ),
        const SizedBox(width: 50),
        Obx(
          () => MyTile(
              text:
                  '${controller.day.value.precipprob.toInt().toString()}km/hr',
              image: ImageAssets.wind,
              color: Colors.white38,
              textColor: Colors.white),
        ),
        // const Spacer(),
        const SizedBox(width: 50),
        Obx(
          () => MyTile(
              text: '${controller.day.value.precipprob.toInt().toString()}%',
              image: ImageAssets.humidity,
              color: Colors.white38,
              textColor: Colors.white),
        ),
        const SizedBox(width: 20),
        // const Spacer(),
      ],
    );
  }
}
