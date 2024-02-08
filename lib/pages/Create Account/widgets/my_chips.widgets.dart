import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

class ReusableChips extends StatefulWidget {
  final List<String> chipLabels;
  final Function(int, bool) onSelectionChanged;

  const ReusableChips({
    Key? key,
    required this.chipLabels,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _ReusableChipsState createState() => _ReusableChipsState();
}

class _ReusableChipsState extends State<ReusableChips> {
  List<bool> _selected;

  _ReusableChipsState() : _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.filled(widget.chipLabels.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 6,
      children: List<Widget>.generate(
        widget.chipLabels.length,
        (int index) {
          return ChoiceChip(
            label: Text(
              widget.chipLabels[index],
              style: TextStyle(
                color: _selected[index] ? Colors.white : Colors.black,
              ),
            ),
            selected: _selected[index],
            onSelected: (bool selected) {
              setState(() {
                _selected[index] = selected;
                widget.onSelectionChanged(index, selected);
              });
            },
            backgroundColor: Colors.white,
            selectedColor: primary,
          );
        },
      ),
    );
  }
}
