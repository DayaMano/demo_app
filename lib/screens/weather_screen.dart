import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _weatherType = '';

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  dynamic fetchWeather() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '11.306867039469985',
      'lon': '78.1844487906247',
      'appid': 'a7ee968df1e55e0c00b523e664a51858'
    });
    final response = await get(url);
    final Map<String, dynamic> resBody = jsonDecode(response.body);
    return resBody;
  }

  void _getWeather() async {
    dynamic res = await fetchWeather();
    String temp = res['weather'][0]['description'];
    setState(() {
      _weatherType = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              _weatherType,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: _getWeather, child: const Text('get Weather')),
        ],
      ),
    );
  }
}
