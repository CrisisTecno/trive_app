import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../Publish/widgets/time_chip.dart';
import '../../../pages.dart';

class DairyTimePartSelect extends StatelessWidget {
  const DairyTimePartSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Escoge una fecha',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.h)),
                  Text('Lunes, 23 de Octubre 2023',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.h)),
                  Text('10:00 AM',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.h)),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(spacing: 15.h, runSpacing: 20.h, children: [
                      AmountChip(
                        amount: '200',
                        currency: 'MXN',
                      ),
                      AmountChip(
                        amount: '200',
                        currency: 'MXN',
                      ),
                    ]),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Propósito de la junta',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.h)),
                          SizedBox(
              height: 20.h,
            ),
                  CustomTextField(),
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.hintText = 'Aprender Programacion avanzada',
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
