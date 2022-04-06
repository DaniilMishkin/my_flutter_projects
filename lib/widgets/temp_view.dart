import 'package:flutter/material.dart';
import 'package:weather/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp!.day?.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(icon),
          Column(
            children: <Widget>[
              Text(
                '$temp℃',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '$description',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
