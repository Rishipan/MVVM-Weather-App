import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/images/image_assets.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

import '../../../Utilities/utilities.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 240,
      width: screenSize.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 240,
            margin: const EdgeInsets.only(bottom: 30),
            width: screenSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.blue.withOpacity(0.4),
                      Colors.blue.withOpacity(0.3),
                    ])),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Obx(() => Image.asset(
                  controller.getImage(controller.currentIndex.value),
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.getCondition(),
                    style: const TextStyle(
                      color: Colors.white,
                      height: 0,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  Utilities.currentTime(),
                  style: TextStyle(
                    height: 0,
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0.1),
                        ]).createShader(bounds);
                  },
                  child: Obx(
                    () => Text(
                      controller.getCurrentTemp(),
                      style: const TextStyle(
                        fontSize: 60,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    'Fill like ${controller.getFeelLike()}',
                    style: const TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 40,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.1),
                    ]).createShader(bounds);
              },
              child: Image.asset(
                ImageAssets.windWave,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
