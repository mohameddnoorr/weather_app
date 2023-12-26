import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
        child: TextFormField(
          onFieldSubmitted: (value) {
            BlocProvider.of<GetWeatherCubit>(context)
                .getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 8,
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(
                Icons.search,
              ),
              suffixIconColor: Colors.grey,
              labelText: 'Search',
              border: OutlineInputBorder()),
        ),
      ),
    );
  }
}
