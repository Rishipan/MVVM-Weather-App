import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/Colors/colors.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/components/app_bar.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/components/bottom_list.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/components/center_card.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/components/days_list.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/days_controller.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class UpcommingDays extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  UpcommingDays({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const MyAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    DaysList(),
                  ],
                ),
                Positioned(
                  bottom: 1,
                  child: Container(
                    height: screenSize.height / 1.9,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        )),
                  ),
                ),
                BottomList(),
                Hero(
                    tag: 'TAG',
                    child: Material(
                      color: Colors.transparent,
                      child: CenterCard(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
