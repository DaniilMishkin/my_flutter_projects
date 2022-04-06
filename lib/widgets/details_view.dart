import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/utilities/forecast_util.dart';

class DetailsView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailsView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    var pressure = forecastList[0].pressure;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.getItem(CupertinoIcons.gauge, pressure!.round(), 'hPa'),
          Util.getItem(CupertinoIcons.drop, humidity!, '%'),
          Util.getItem(CupertinoIcons.wind, wind!.toInt(), 'km/h')
        ],
      ),
    );
  }
}
