import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_today_weather/features/weather/presentation/bloc/weather_bloc.dart';

class LocationSearchBar extends StatelessWidget {
  const LocationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Search location...',
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              context.read<WeatherBloc>().add(GetWeatherByCity(value));
            }
          },
        ),
      ),
    );
  }
} 