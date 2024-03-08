//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage('public/assets/images/profile_1.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Enrique Pablos",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Co founder de Trive",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff0E0E0E),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
