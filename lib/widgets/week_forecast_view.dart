import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:weather/widgets/forecast_card.dart';

class WeekForecastView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const WeekForecastView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          color: const Color.fromARGB(125, 158, 158, 158),
          child: Row(
            children: const <Widget>[
              Icon(
                CupertinoIcons.calendar,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '7-DAY FORECAST',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          height: 360,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              color: const Color.fromARGB(125, 158, 158, 158),
              child: ForecastCard(snapshot, index),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: snapshot.data!.list!.length,
          ),
        ),
      ],
    );
  }
}
