import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/Model/data_model.dart';
import 'package:getx_mvvm_weather_with_apis/Repository/home_repository.dart';
import 'package:getx_mvvm_weather_with_apis/Utilities/utilities.dart';
import 'package:getx_mvvm_weather_with_apis/View/Home/home_screen.dart';

import '../../Resources/images/image_assets.dart';

class HomeController extends GetxController {
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;

  int getCurrentIndex() {
    return currentIndex.value;
  }

  bool compareIndex(int index) {
    return (index == currentIndex.value);
  }

  String getHour(int index) {
    return Utilities.currentTime24(
        model.value!.days![0].hours![index].datetime.toString());
  }

  String getImage(int index) {
    return Utilities().imageMap[
            model.value!.days![0].hours![index].conditions.toString()] ??
        ImageAssets.nightStartRain;
  }

  String getAddress() {
    return '${model.value!.address.toString().toUpperCase()},\n${model.value!.timezone.toString()}';
  }

  String getCondition() {
    return hours.value!.conditions.toString();
  }

  String getCurrentTemp() {
    return hours.value!.temp!.toInt().toString();
  }

  String getFeelLike() {
    return hours.value!.feelslike.toString();
  }

  String getCloudOver() {
    return hours.value!.cloudcover!.toInt().toString();
  }

  String getWindSpeed() {
    return hours.value!.windspeed!.toInt().toString();
  }

  String getHumidity() {
    return hours.value!.humidity!.toInt().toString();
  }

  getData() {
    HomeRepository repository = HomeRepository();
    repository.hitApi().then((value) {
      model.value = DataModel.fromJson(value);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
        if (Utilities.checkTime(
            model.value!.days![0].hours![i].datetime.toString())) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
      Get.to(const HomeScreen());
    });
  }

  setHour(int index) {
    Timer(const Duration(milliseconds: 100), () => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100), () => animator.value = false);
  }
}
