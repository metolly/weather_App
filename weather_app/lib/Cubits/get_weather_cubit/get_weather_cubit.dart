import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_servces.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherSate());
  WeatherModel? weatherModel;
  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(CityName: cityname);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
