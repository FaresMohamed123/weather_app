import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widget/noweather_body.dart';
import 'package:weather_app/views/search_views.dart';
import 'package:weather_app/widget/weatherInFo_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
        var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchViews(),
                  ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ))
          ],
          backgroundColor: weatherModel.temp > 25?
          Colors.amber:Colors.blue,
          elevation: 0,
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return const WeatherInFoBody();
            } else {
              return const Text('opps there was an error');
            }
          },
        ));
  }
}
