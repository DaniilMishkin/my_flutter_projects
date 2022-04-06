import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/search_screen.dart';
import 'package:weather/widgets/city_view.dart';
import 'package:weather/widgets/details_view.dart';
import 'package:weather/widgets/temp_view.dart';
import 'package:weather/widgets/week_forecast_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> dailyForecastObject;
  late Future<WeatherForecast> currentForecasfObject;

  String _cityName = 'Minsk';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      dailyForecastObject = Future.value(widget.locationWeather);
      currentForecasfObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('openweathermap.org '),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              dailyForecastObject = WeatherAPI().fetchDailyForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              var searchName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
              if (searchName != null) {
                setState(() {
                  _cityName = searchName;
                  dailyForecastObject = WeatherAPI()
                      .fetchDailyForecast(cityName: _cityName, isCity: true);
                });
              }
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: dailyForecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      CityView(snapshot: snapshot),
                      TempView(snapshot: snapshot),
                      const SizedBox(
                        height: 20,
                      ),
                      WeekForecastView(snapshot: snapshot),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailsView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.blue,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
