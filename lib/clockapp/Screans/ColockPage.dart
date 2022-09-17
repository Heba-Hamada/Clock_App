import 'package:flutter/material.dart';
import 'package:flutter_application_2/clockapp/ClocklVtew.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedtime = DateFormat('HH,mm').format(now);

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Text(
                  formattedtime,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 24),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
