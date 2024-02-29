import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/images/image_assets.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Components/tile.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class TileList extends StatelessWidget {
  TileList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => MyTile(
              text: '${controller.getCloudOver()}%',
              image: ImageAssets.storm,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => MyTile(
              text: '${controller.getWindSpeed()}km/h',
              image: ImageAssets.wind,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
          Obx(
            () => MyTile(
              text: '${controller.getHumidity()}%',
              image: ImageAssets.humidity,
              color: Colors.black54,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
