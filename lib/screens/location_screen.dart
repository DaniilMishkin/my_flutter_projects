import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/screens/weather_forecast_screeen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  getLocationData() async {
    try {
      var weatherInfo = await WeatherAPI().fetchDailyForecast();
      return Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(
          locationWeather: weatherInfo,
        );
      }));
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.blue),
      ),
    );
  }
}
