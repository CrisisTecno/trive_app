import 'package:flutter/material.dart';

class Encabezado extends StatelessWidget {
  const Encabezado({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(child: Text('data')),
          ],
        ),
      ),
    );
  }
}
