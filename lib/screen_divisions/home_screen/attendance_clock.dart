import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';




class attendance extends StatefulWidget {
  const attendance({Key? key}) : super(key: key);

  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  final String currentTime = getSystemTime();

  static String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("HH:mm:ss").format(now);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Container(
          height: 300,
          width: width*0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [BoxShadow(
              color: Color(0xFFEFEFEF),
              spreadRadius: 5,
              blurRadius: 4
            )],
            // border: Border.all(color: Colors.black)
          ),
          child: Column(
            children: [
              TimerBuilder.periodic(
                  const Duration(seconds: 1),
                  builder: (context) {
                return Text(
                  getSystemTime(),
                  style: const TextStyle(
                      fontSize: 30,),
                );
              }),
            ],
          ),
        )
      ),
    );
  }
}
