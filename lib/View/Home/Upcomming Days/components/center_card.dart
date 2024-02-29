import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/images/image_assets.dart';
import 'package:getx_mvvm_weather_with_apis/Utilities/utilities.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/components/small_box_list.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/days_controller.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class CenterCard extends StatelessWidget {
  CenterCard({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 440,
      width: size.width,
      margin: const EdgeInsets.only(top: 80),
      child: Stack(
        children: [
          Positioned(
            bottom: 90,
            left: 30,
            right: 30,
            child: Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.withOpacity(.7),
                        Colors.blue.withOpacity(.5),
                        Colors.blue.withOpacity(.7),
                      ])),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(.5),
                                  ]).createShader(bounds);
                            },
                            child: Obx(
                              () => Text(
                                '${controller.day.value.temp.toInt().toString()}\u00B0',
                                style: const TextStyle(
                                  fontSize: 80,
                                  height: 0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Obx(() => Text(
                                'Feel like ${controller.day.value.feelslike}',
                                style: const TextStyle(
                                  height: 0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Obx(
                            () => Text(
                              controller.day.value.conditions,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            Utilities.currentTime(),
                            style: TextStyle(
                              height: 0,
                              color: Colors.white.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(.5),
                            ]).createShader(bounds);
                      },
                      child: Image.asset(
                        ImageAssets.windWave,
                        height: 100,
                        width: 160,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      width: size.width * 60,
                      child: SmallBoxList(),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 10,
                    child: Obx(() => Image.asset(
                          controller.getImage(
                            controller.currentDay.value,
                          ),
                          height: 100,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
