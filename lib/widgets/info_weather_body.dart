import 'package:flutter/material.dart';
import 'package:last_weather/main.dart';
import 'package:last_weather/models/weather_model.dart';

class InfoWeatherBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const InfoWeatherBody({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherState)[500]!,
            getThemeColor(weatherModel.weatherState)[300]!,
            getThemeColor(weatherModel.weatherState)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 4,
          ),
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at ${weatherModel.localtime.hour}:${weatherModel.localtime.minute}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: NetworkImage(
                    'https:${weatherModel.image}',
                    scale: 1.0,
                  ),
                ),
                Text(
                  '${weatherModel.avgTemp}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Max : ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Min : ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            weatherModel.weatherState,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
