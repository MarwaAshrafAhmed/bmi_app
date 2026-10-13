import 'package:flutter/material.dart';

class WeightInfoItemRow extends StatelessWidget {
  const WeightInfoItemRow({super.key,required this.color,required this.value,required this.status});

  final Color color;
  final String value;
  final String status;
  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 16,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: .w500,
          ),
        ),

        Spacer(),
        Text(
          status,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: .w500,
          ),
        ),
      ],);
  }
}
