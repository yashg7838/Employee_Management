// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, camel_case_types

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
  final String _present = '17';
  final String _holidays = '03';
  final String _leaves = '02';
  final String _penalty = '00';
  final String _casualleaves = '02';
  final String _sickleaves = '02';
  final String _maternityleaves = '00';


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
                        Text(_present,style: const TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w600 ),),
                        const SizedBox(width: 5,),
                        const Text("Present")
                      ],
                    ),
                    SizedBox(
                      width: 135,
                      child: Row(
                        children: [
                          Text(_leaves,style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                          const SizedBox(width: 5,),
                          const Text("Leaves")
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
                        Text(_holidays,style: const TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w600 ),),
                        const SizedBox(width: 5,),
                        const Text("Holidays")
                      ],
                    ),
                    SizedBox(
                      width: 135,
                      child: Row(
                        children: [
                          Text(_casualleaves,style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                          const SizedBox(width: 5,),
                          const Text("Casual Leaves")
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
                        Text(_leaves,style: const TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w600 ),),
                        const SizedBox(width: 5,),
                        const Text("Leaves")
                      ],
                    ),
                    SizedBox(
                      width: 135,
                      child: Row(
                        children: [
                          Text(_sickleaves,style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                          const SizedBox(width: 5,),
                          const Text("Sick Leaves")
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
                        Text(_penalty,style: const TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w600 ),),
                        const SizedBox(width: 5,),
                        const Text("Penalty")
                      ],
                    ),
                    SizedBox(
                      width: 135,
                      child: Row(
                        children: [
                          Text(_maternityleaves,style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w600 ),),
                          const SizedBox(width: 5,),
                          const Text("Maternity Lea.")
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