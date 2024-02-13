import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../widgets/widgets.dart';

import '../../../widgets/widgets.dart';

class CreateAccountScreen3 extends StatelessWidget {
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
                    numberOfContainers: 2,
                    color: primary,
                    height: 5.h,
                    spacing: 10,
                    containerWidthFactor:
                        0.16, // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                  )),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Tus Intereses',
                    style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold,
                        color: primary),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Negocios y Emprendimiento',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Marketing',
                          'Finanzas',
                          'Ventas',
                          'Publicidad',
                          'Liderazgo',
                          'Bienestar'
                        ],
                        onSelectionChanged: (index, isSelected) {
                          print(
                              'Chip $index is now ${isSelected ? 'selected' : 'deselected'}');
                        },
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Desarrollo Personal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Salud',
                          'Bienestar',
                          'Relaciones',
                        ],
                        onSelectionChanged: (index, isSelected) {
                          print(
                              'Chip $index is now ${isSelected ? 'selected' : 'deselected'}');
                        },
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Tecnología y Ciencia',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Marketing',
                          'Finanzas',
                          'Ventas',
                          'Publicidad',
                          'Liderazgo',
                          'Bienestar'
                        ],
                        onSelectionChanged: (index, isSelected) {
                          print(
                              'Chip $index is now ${isSelected ? 'selected' : 'deselected'}');
                        },
                      ),
                    ]),
              ),
              SizedBox(height: 180.h),
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    onClick: () {
                      Navigator.of(context)
                          .pushNamed(RouteManager.createaccount4);
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
