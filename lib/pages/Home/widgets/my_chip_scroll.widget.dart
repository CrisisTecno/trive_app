import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart'; // Asumiendo que 'primary' está definido aquí.

class ReusableChipsRow extends StatefulWidget {
  final List<String> chipLabels;
  final Function(int, bool) onSelectionChanged;

  const ReusableChipsRow({
    Key? key,
    required this.chipLabels,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _ReusableChipsRowState createState() => _ReusableChipsRowState();
}

class _ReusableChipsRowState extends State<ReusableChipsRow> {
  List<bool> _selected;

  _ReusableChipsRowState() : _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.filled(widget.chipLabels.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          widget.chipLabels.length,
          (int index) {
            return Container( 
              
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.all(Radius.circular(17.h))),
                child: ChoiceChip(
                  
                  label: Text(
                    textAlign:TextAlign.center ,
                    
                    widget.chipLabels[index],
                    style: TextStyle(
                      color: _selected[index] ? Colors.white : Colors.black,
                    ),
                  ),
                  padding:EdgeInsets.symmetric(vertical: 4.0), 
                  selected: _selected[index],
                  onSelected: (bool selected) {
                    setState(() {
                      _selected[index] = selected;
                      widget.onSelectionChanged(index, selected);
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: primary, // Asegúrate de que 'primary' está definido en tu paquete de colores.
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
