// ignore_for_file: depend_on_referenced_packages, camel_case_types, non_constant_identifier_names

import 'package:employee_management/widgets/buttons/button_1.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:percent_indicator/percent_indicator.dart';

class attendance extends StatefulWidget {
  const attendance({Key? key}) : super(key: key);
  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {

  final String currentTime = getSystemTime();
  double sec = 0;
  String status = "Absent";
  String start_time = "-";
  String end_time = "-";

  static String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("HH:mm:ss").format(now);
  }
  static String getSystemDate() {
    var now = DateTime.now();
    return DateFormat("EE, dd MMM yyyy").format(now);
  }
  double getShiftProgress() {
    sec = sec + 0.5;
    double percent = sec/28800;
    return percent;
  }
  static String getStartTime() {
    var now = DateTime.now();
    return DateFormat("jm").format(now);
  }
  static String getEndTime() {
    var now = DateTime.now();
    var future  = now.add(const Duration(hours: 9));
    return DateFormat("jm").format(future);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 220,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: (width*0.90)*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      TimerBuilder.periodic(
                          const Duration(seconds: 1),
                          builder: (context) {
                            return Text(
                              getSystemDate(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                            );
                          }),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                InkWell(
                  onTap: (){
                    sec > 28800 || status == "Absent"?
                    setState(() {

                      status == "Absent"?
                      status = "Present":
                      status = "Absent";

                      status == "Present"?
                      start_time = getStartTime():
                      start_time = "-";

                      status == "Present"?
                      end_time = getEndTime():
                      end_time = "-";

                      sec = 0;
                    }):
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context){
                            return Container(
                              color: const Color.fromARGB(100, 22, 44, 33),
                              child: AlertDialog(
                                title: const Text("Are you sure you want check out before time?"),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        setState(() {
                                          Navigator.pop(context);
                                          status = "Absent";

                                          start_time = "-";

                                          end_time = "-";

                                          sec = 0;
                                        });
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"))
                                ],
                              ),
                            );
                          });
                    });
                  },
                  child: button_1(
                    btn_width: (width*0.90)*0.9,
                    btn_color: status == "Present"?const Color(0xFFFD4F4F):const Color(0xFF4BD21B),
                    btn_text: status == "Absent"?"Clock In":"Clock Out",
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: (width*0.90)*0.03,
                    ),

                    TimerBuilder.periodic(
                        const Duration(seconds: 1),
                        builder: (context) {
                          // print(sec);
                          return status == "Present"?
                          LinearPercentIndicator(
                            lineHeight: 2,
                            width: (width*0.90)*0.94,
                            percent: getShiftProgress() > 1 ? 1 : getShiftProgress(),
                            progressColor: const Color(0xFF4BD21B),
                          ):
                          LinearPercentIndicator(
                            lineHeight: 2,
                            width: (width*0.90)*0.94,
                            percent: 0,
                            progressColor: const Color(0xFF4BD21B),
                          );
                        }),
                  ],
                ),

                const SizedBox(
                  height: 5,
                ),

                TimerBuilder.periodic(
                    const Duration(seconds: 1),
                    builder: (context) {
                      return SizedBox(
                        width: (width*0.90)*0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            start_time == "-"?
                            const Text(
                              "--:--",
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            ):
                            Text(
                              start_time,
                              style: const TextStyle(
                                  fontSize: 10
                              ),
                            ),

                            // start_time == "-"?
                            // const Text(
                            //   "--%",
                            //   style: TextStyle(
                            //       fontSize: 10
                            //   ),
                            // ):
                            // Text(
                            //   getShiftProgress()<1?
                            //   (getShiftProgress()*100).toStringAsFixed(2)+"%":
                            //   "100.00%",
                            //   style: const TextStyle(
                            //       fontSize: 10
                            //   ),
                            // ),

                            const Text(
                              "7:00 PM",
                              style: TextStyle(
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                      );
                    }),

                const SizedBox(
                  height: 15,
                ),

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
          ),
        )
      ),
    );
  }
}
