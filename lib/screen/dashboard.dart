// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:employee_management/screen_divisions/home_screen/attendance.dart';
import 'package:employee_management/screen_divisions/home_screen/attendance_clock.dart';
import 'package:employee_management/screen_divisions/home_screen/celebration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screen_divisions/home_screen/holidays.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("hello"),
      // ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/Ellipse 1.png",
                          height: 33,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/plus-circle.svg",
                              height: 33,
                            ),
                            SizedBox(
                              width: width*.02,
                            ),
                            Image.asset(
                              "assets/images/TTH_logo.png",
                              height: 33,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const attendance(),
                  const SizedBox(height: 30,),
                  const attendanceListWidget(),
                  const SizedBox(height: 30,),
                  const HolidaysListWidget(),
                  const SizedBox(height: 30,),
                  const CelebrationListWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
