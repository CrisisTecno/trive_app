import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Create%20Account/widgets/my_chips.widgets.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/chip_amount.widget.dart';
import '../widgets/dynamic_bar.widget.dart';

class CreateAccountScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: DynamicContainerRow(
                    numberOfContainers: 5,
                    color: primary,
                    height: 5.h,
                    spacing: 10,
                    containerWidthFactor:
                        0.16, // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                  )),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(flex: 5),
                  Text(
                    'Subscripcion',
                    style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold,
                        color: primary),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  TextButton(onPressed: () {}, child: Text('Omitir')),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elige el precio de tu suscripción',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.h),
                      Wrap(
                        spacing: 15.h,
                        runSpacing: 20.h,
                        children: [
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                          AmountChip(
                            amount: '200',
                            currency: 'MXN',
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Text(
                            'Código para acceder',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Text(
                          'Solo podrán suscribirse los que tengan un código de acceso',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 150.h),
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    onClick: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.createaccount5);
                    },
                    title: 'Continuar',
                    backgroundColor: primary,
                    titleColor: Colors.white,
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
