
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/network/weather_provider.dart';
import 'package:weather_app/widgets/weather_container.dart';

class WeatherOverview extends StatelessWidget {
  final _weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Overview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Weather>(
              future: _weatherProvider.getCurrentWeather(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return WeatherContainer(weather: snapshot.data);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
