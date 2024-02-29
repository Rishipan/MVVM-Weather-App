import 'package:get/get.dart';

import 'package:getx_mvvm_weather_with_apis/Model/data_model.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/images/image_assets.dart';
import 'package:getx_mvvm_weather_with_apis/Utilities/utilities.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class DaysController extends GetxController {
  RxInt currentDay = 0.obs;
  final homeController = Get.put(HomeController());
  late Rx<Days> day;

  DaysController() {
    day = homeController.model.value!.days![0].obs;
  }

  setDay(int index) {
    day.value = homeController.model.value!.days![index];
    currentDay.value = index;
  }

  String getImage(int index) {
    Utilities utilities = Utilities();
    return utilities.imageMap[
                homeController.model.value!.days![index].conditions] ==
            null
        ? ImageAssets.nightStartRain
        : utilities
            .imageMap[homeController.model.value!.days![index].conditions]!;
  }

  String getMonth(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();
    return Utilities.extractDate(date);
  }

  String getMonthDay(int index) {
    String date = homeController.model.value!.days![index].datetime.toString();

    return Utilities.extractDay(date);
  }

  String getDate(int index) {
    DateTime date = DateTime.parse(
        homeController.model.value!.days![index].datetime.toString());
    return Utilities.formateDate(date);
  }

  String getMinTemp(int index) {
    return '${homeController.model.value!.days![index].tempmin!.toInt().toString()}\u00B0';
  }

  String getMaxTemp(int index) {
    return '${homeController.model.value!.days![index].tempmax!.toInt().toString()}\u00B0';
  }
}
