// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HolidaysListWidget extends StatefulWidget {
  const HolidaysListWidget({super.key});

  @override
  _HolidaysListWidgetState createState() => _HolidaysListWidgetState();
}

class _HolidaysListWidgetState extends State<HolidaysListWidget> {
  DateTime _selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 300,
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
                    'Holidays',
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: (width*.9)*0.05,right: (width*.9)*0.05),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Center(
                              child: Text(
                                '7',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good Friday',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}