import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/Colors/colors.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Components/info_card.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Components/location.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Components/tile_list.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/Upcomming%20Days/upcomming_14_days.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

import 'Components/hours_list.dart';
import 'Components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const SearchBar(),
                Location(),
                Hero(
                  tag: 'TAG',
                  child: Material(
                    color: Colors.transparent,
                    child: InfoCard(),
                  ),
                ),
                const SizedBox(height: 10),
                TileList(),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Get.to(() => UpcommingDays());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Upcomming 14 Days >',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                HoursList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
