import 'package:last_weather/models/weather_model.dart';

class WeatherStates {}

class InitialWeatherState extends WeatherStates {}

class LoadingWeatherState extends WeatherStates {}

class SuccessWeatherState extends WeatherStates {
  final WeatherModel weatherModel;

  SuccessWeatherState(this.weatherModel);
}

class FailuerWeatherState extends WeatherStates {
  final String errMesseg;

  FailuerWeatherState(this.errMesseg);
}
