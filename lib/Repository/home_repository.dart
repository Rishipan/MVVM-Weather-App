import 'package:getx_mvvm_weather_with_apis/Data/Network/api_services.dart';
import 'package:getx_mvvm_weather_with_apis/Resources/AppUrl/app_url.dart';

class HomeRepository {
  Future<dynamic> hitApi() async {
    var appUrl = AppUrl();
    var response = await ApiServices().getApi(appUrl.url);
    return response;
  }
}
