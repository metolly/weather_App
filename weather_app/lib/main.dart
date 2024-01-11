import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getColorTheme(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weathercondetion,
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
      return Colors.orange;
    case 'partly_cloudy':
      return Colors.yellow;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.grey;
    case 'patchy_rain':
    case 'patchy_snow':
    case 'patchy_sleet':
    case 'patchy_drizzle':
      return Colors.lightBlue;
    case 'thundery_outbreaks':
      return Colors.deepPurple;
    case 'blowing_snow':
    case 'blizzard':
    case 'fog':
    case 'freezing_fog':
      return Colors.grey;
    case 'drizzle':
    case 'light_rain':
      return Colors.lightBlue;
    case 'moderate_rain':
    case 'heavy_rain':
      return Colors.blue;
    case 'freezing_rain':
    case 'sleet':
    case 'snow':
      return Colors.lightBlue;
    case 'ice_pellets':
      return Colors.grey;
    case 'rain_showers':
      return Colors.lightBlue;
    case 'sleet_showers':
      return Colors.blue;
    case 'showers_of_ice_pellets':
      return Colors.grey;
    case 'rain_with_thunder':
    case 'snow_with_thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
