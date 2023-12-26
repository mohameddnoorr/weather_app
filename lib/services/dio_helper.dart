import 'package:dio/dio.dart';
import 'package:last_weather/models/weather_model.dart';

class DioHelper {
  Dio dio = Dio();

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=0049c212227e4c068d5132743230505&q=$cityName');

      Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error , try later');
    }
  }
}
