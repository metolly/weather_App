import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = 'f7732e269266477b91b191932230212';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$CityName&days=1');
      WeatherModel weatherModel = WeatherModel.formJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later';
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error ,try later');
    }
  }
}
