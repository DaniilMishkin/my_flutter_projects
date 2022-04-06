import 'package:flutter/material.dart';
import 'package:weather/utilities/forecast_util.dart';

Widget ForecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data!.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDay = Util.getFormattedDate(date);
  var dayOfWeek = fullDay.split(',')[0];

  var minTemp = forecastList[index].temp.min.toStringAsFixed(0);
  var maxTemp = forecastList[index].temp.max.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Row(
    children: <Widget>[
      Container(
        width: 70,
        padding: const EdgeInsets.only(left: 10, right: 20),
        child: Text(
          dayOfWeek,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: 70,
        child: Image.network(
          icon,
          scale: 1.4,
        ),
      ),
      Container(
        width: 70,
        child: Text('L:$minTemp℃'),
      ),
      Container(
        width: 70,
        child: Text('H:$maxTemp℃'),
      ),
    ],
  );

  // return Column(
  //   mainAxisAlignment: MainAxisAlignment.start,
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: <Widget>[
  //     Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           '$dayOfWeek',
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     ),
  //     Center(
  //       child: Image.network(icon, scale: 1.2),
  //     ),
  //     Center(
  //       child: Text('L:$minTemp℃'),
  //     ),
  //     Center(
  //       child: Text('H:$maxTemp℃'),
  //     )
  //   ],
  // );
}
