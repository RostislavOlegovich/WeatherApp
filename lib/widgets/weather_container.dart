import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  final Weather weather;

  Widget _landscapeMode(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '${weather.locationName}',
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.center,
              ),
              Text(
                '${weather.temperature.toInt()} °C',
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Image.network(weather.iconUrl),
        ],
      ),
    );
  }

  Widget _portraintMode(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${weather.locationName} - ${weather.temperature} °C',
          style: Theme.of(context).textTheme.display1,
          textAlign: TextAlign.center,
        ),
        Image.network(weather.iconUrl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return MediaQuery.of(context).orientation == Orientation.portrait
            ? _portraintMode(context)
            : _landscapeMode(context);
      },
    );
  }
}
