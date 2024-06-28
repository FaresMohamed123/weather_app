import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/home_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WeatherServices(Dio()).getCurrentWeather(cityName: 'Cairo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red),
        home: const HomeView(),
      ),
    );
  }
} 
