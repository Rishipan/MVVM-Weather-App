import 'package:get/get.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Controllers/home_controller.dart';

class SplashServices {
  static void getApiData() {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}
