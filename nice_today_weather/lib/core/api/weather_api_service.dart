import 'package:dio/dio.dart';

class WeatherApiService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '7f5cb3deb228f2f9f4c1f4cf9402034c';

  final Dio _dio;

  WeatherApiService() : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    queryParameters: {'appid': apiKey, 'units': 'metric'},
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  Future<Map<String, dynamic>> getCurrentWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  Future<Map<String, dynamic>> getWeatherByCity(String cityName) async {
    try {
      final response = await _dio.get(
        '/weather',
        queryParameters: {
          'q': cityName,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  Future<Map<String, dynamic>> getForecast(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch forecast data: $e');
    }
  }
} 