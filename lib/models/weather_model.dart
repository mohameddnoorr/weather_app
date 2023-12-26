class WeatherModel {
  final String cityName;
  final DateTime localtime;
  final String image;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherState;

  WeatherModel({
    required this.cityName,
    required this.localtime,
    required this.image,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherState,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        localtime: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherState: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
