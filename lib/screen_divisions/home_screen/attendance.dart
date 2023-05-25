// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class attendanceListWidget extends StatefulWidget {
  const attendanceListWidget({super.key});

  @override
  _attendanceListWidgetState createState() => _attendanceListWidgetState();
}

class _attendanceListWidgetState extends State<attendanceListWidget> {
  DateTime _selectedMonth = DateTime.now();
  String _present = '17';
  String _holidays = '03';
  String _leaves = '02';
  String _penalty = '00';
  String _casualleaves = '02';
  String _sickleaves = '02';
  String _maternityleaves = '00';


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 225,
        width: width*0.9,
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
              width: (width*.9)*.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Attendance',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: _selectedMonth,
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            _selectedMonth = value;
                          });
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('MMMM yyyy').format(_selectedMonth),
                              style: const TextStyle(fontSize: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: SvgPicture.asset(
                                "assets/icons/Path (Stroke).svg",
                                height: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: (width*.9)*.9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('$_present',style: TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          child: Text("Present"),
                        )
                      ],
                    ),
                    Container(
                      width: 115,
                      child: Row(
                        children: [
                          Container(
                            child: Text('$_leaves',style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w600 ),),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            child: Text("Leaves"),
                          )
                        ],
                      ),
                    )
                  ],)
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: (width*.9)*.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('$_holidays',style: TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          child: Text("Holidays"),
                        )
                      ],
                    ),
                    Container(
                      width: 115,
                      child: Row(
                        children: [
                          Container(
                            child: Text('$_casualleaves',style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w600 ),),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            child: Text("Casual Leaves"),
                          )
                        ],
                      ),
                    )
                  ],)
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: (width*.9)*.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('$_leaves',style: TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          child: Text("Leaves"),
                        )
                      ],
                    ),
                    Container(
                      width: 115,
                      child: Row(
                        children: [
                          Container(
                            child: Text('$_sickleaves',style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w600 ),),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            child: Text("Sick Leaves"),
                          )
                        ],
                      ),
                    )
                  ],)
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: (width*.9)*.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('$_penalty',style: TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          child: Text("Penalty"),
                        )
                      ],
                    ),
                    Container(
                      width: 115,
                      child: Row(
                        children: [
                          Container(
                            child: Text('$_maternityleaves',style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w600 ),),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            child: Text("Maternity Lea."),
                          )
                        ],
                      ),
                    )
                  ],)
            ),

          ],
        ),
      ),
    );
  }
}