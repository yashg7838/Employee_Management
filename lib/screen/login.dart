import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                child: Image.asset(
                  "assets/images/login_office.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height*.35,
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              "assets/images/logo-4.png",
                              width: 400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
