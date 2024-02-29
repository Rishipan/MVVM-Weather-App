import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/days_controller.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class BottomList extends StatelessWidget {
  BottomList({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 1,
      child: SizedBox(
        height: size.height / 2,
        width: size.width,
        child: ListView.builder(
          itemCount: homeController.model.value!.days!.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white38,
              margin: EdgeInsets.only(
                  left: 20, right: 20, top: index == 0 ? 230 : 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white38,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.getDate(index),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: controller.getMinTemp(index),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const TextSpan(
                            text: '/',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: controller.getMaxTemp(index),
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      controller.getImage(index),
                      height: 70,
                      width: 70,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
