import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        TimeOfDay? newTime =
            await showTimePicker(context: context, initialTime: time);
        if (newTime == null) return;
        setState(() {
          time = newTime;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          child: Text(
            " TimePick",
            style: TextStyle(fontSize: 18),
          )
          /*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*  Text(
            "${time.hour}:${time.minute}",
            style: TextStyle(fontSize: 32),
          ),*/
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? newTime =
                        await showTimePicker(context: context, initialTime: time);
                    if (newTime == null) return;
                    setState(() {
                      time = newTime;
                    });
                  },
                  child: Text(" TimePick"))
            ],
          )*/
          ),
    );
  }
}
