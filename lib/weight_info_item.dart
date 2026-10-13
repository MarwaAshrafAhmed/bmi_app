import 'package:flutter/material.dart';

class WeightInfoItem extends StatelessWidget {
  const WeightInfoItem({
    super.key,
    required this.color,
    required this.status,
    required this.value,
  });

  final Color color;
  final String status;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          height: 32,
          width: 32,

        ),

        Text(
          status,
          style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: .w500),
        ),

        Text(
          value,
          style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: .w500),
        ),
      ],
    );
  }
}

