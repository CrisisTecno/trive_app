
import 'package:flutter/material.dart';
import 'utils.dart';
class SizeUtils {
  /// Restricciones del tamaño de pantalla 
  static late BoxConstraints boxConstraints;

  /// Orientacion del dispositivo
  static late Orientation orientation;
  
  /// Tipo de dispositivo 
  static late DeviceType deviceType;

  /// Alto
  static late double height;

  /// Ancho
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    
    //definos las dimensiones en funcion del dispositivo en el cual estamos
    if (orientation == Orientation.portrait) {
      width =
          boxConstraints.maxWidth.isNonZero(defaultValue: MIN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width =
          boxConstraints.maxHeight.isNonZero(defaultValue: MIN_HEIGTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}

extension FormatExtension on double {
  // retornamos con un numero especifico de digitos
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }
  //retornoamos un defatult valor si lo que tenemos es menor a cero 
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}