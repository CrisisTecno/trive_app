
import 'package:flutter/material.dart';
import 'utils.dart';
import 'size_utils.dart';
// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
//widget (tipo) encargado de las dimensiones en un dispositivo (orientacion,tipo de dispositivo) 
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// necesitamos el resposibe builder
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}
extension ResponsiveExtension on num {

  double get _width => SizeUtils.width;

  double get _height => SizeUtils.height;

  double get w => ((this * _width) / MIN_WIDTH);

  double get h => (this * _height) / (MIN_HEIGTH - STATUS_BAR);

  double get adaptSize {
    var height = h;
    var width = w;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  double get fSize => adaptSize;
}