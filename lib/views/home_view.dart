import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:last_weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:last_weather/views/search_view.dart';
import 'package:last_weather/widgets/info_weather_body.dart';
import 'package:last_weather/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is SuccessWeatherState) {
            return InfoWeatherBody(
              weatherModel: state.weatherModel,
            );
          } else if (state is InitialWeatherState) {
            return const NoWeatherBody();
          } else if (state is LoadingWeatherState) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text('No matching location found'));
        },
      ),
    );
  }
}
