import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:last_weather/models/weather_model.dart';

import '../../services/dio_helper.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialWeatherState());

   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    emit(LoadingWeatherState());
    try {
      weatherModel = await DioHelper().getWeather(cityName: cityName);
      emit(SuccessWeatherState(weatherModel!));
    } catch (e) {
      emit(FailuerWeatherState(e.toString()),);
      log(e.toString());
    }
  }
}
