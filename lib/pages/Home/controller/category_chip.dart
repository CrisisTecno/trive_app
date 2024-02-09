import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String title;

  CategoryChip({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(title),
        selected: false,
        onSelected: (bool selected) {},
        backgroundColor: Color(0xffF6F6F6),
        selectedColor: Color(0xff3A5FEB).withOpacity(0.2),
      ),
    );
  }
}