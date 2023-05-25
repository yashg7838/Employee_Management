import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CelebrationListWidget extends StatefulWidget {
  @override
  _CelebrationListWidgetState createState() => _CelebrationListWidgetState();
}

class _CelebrationListWidgetState extends State<CelebrationListWidget> {
  DateTime _selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width*0.9,
      height: 300,

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
            width: (width*0.9)*.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Celebrations',
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
                  child: Row(
                    children: [
                      Text(
                        DateFormat('MMMM yyyy').format(_selectedMonth),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Center(
                            child: Text(
                              '24',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45
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
                                'Someone\'s Birthday',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
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
    );
  }
}