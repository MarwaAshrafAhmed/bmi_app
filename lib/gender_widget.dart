import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.icon,
    required this.gender,
    required this.isActive,
    required this.tap,
  });

  final IconData icon;
 final String gender;
  final bool isActive;
  final void Function()? tap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: tap,
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: isActive ? Colors.deepPurple : Colors.grey.shade300,
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isActive ? Colors.white : Colors.black,
                size: 56,
              ),
              Text(
                gender,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: 24,
                    fontWeight: .w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
