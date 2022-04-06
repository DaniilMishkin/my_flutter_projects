import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Container(
      width: 120,
      height: 120,
      color: Color.fromARGB(125, 158, 158, 158),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 25,
          ),
          const SizedBox(height: 10),
          Text(
            '$value',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            units,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
