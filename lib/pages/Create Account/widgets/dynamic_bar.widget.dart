import 'package:flutter/material.dart';

class DynamicContainerRow extends StatelessWidget {
  final int numberOfContainers;
  final Color color;
  final double height;
  final double spacing;
  final double containerWidthFactor; // Factor para calcular el ancho basado en el tamaño de la pantalla

  const DynamicContainerRow({
    Key? key,
    required this.numberOfContainers,
    required this.color,
    required this.height,
    required this.spacing,
    required this.containerWidthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    List<Widget> containers = List<Widget>.generate(
      numberOfContainers,
      (index) => Container(
        width: screenSize.width * containerWidthFactor,
        color: color,
        height: height,
      ),
    );

    for (int i = containers.length - 1; i > 0; i--) {
      containers.insert(i, SizedBox(width: spacing));
    }

    return Row(
      children: containers,
    );
  }
}
