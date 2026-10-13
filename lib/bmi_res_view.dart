import 'package:bmi_app/button.dart';
import 'package:bmi_app/home_screen.dart';
import 'package:bmi_app/weight_info_item_row.dart';
import 'package:flutter/material.dart';

class BmiResView extends StatelessWidget {
  const BmiResView({
    super.key,
    required this.status,
    required this.bmiRes,
    required this.color,
  });

  final String status;
  final Color color;
  final double bmiRes;


  Color getColor(double bmiRes) {
    if (bmiRes < 18.5) {
      return Colors.blueAccent;
    } else if (bmiRes < 25) {
      return Colors.green;
    } else if (bmiRes < 30) {
      return Colors.orangeAccent;
    } else {
      return Colors.deepOrange;
    }
  }

  String getStatus(double bmiRes) {
    if (bmiRes < 18.5) {
      return "Underweight";
    } else if (bmiRes < 25) {
      return "Normal";
    } else if (bmiRes < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: .center,
            children: [
              Center(
                child: Text(
                  "Your BMI Result",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: .w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: color.withAlpha(60),
                  border: BoxBorder.all(color: color, width: 4),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "${bmiRes.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: color,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "BMI",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                spacing: 8,
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.check_circle, color: color, size: 40),
                  Text(
                    status,
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                      fontWeight: .w500,
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: color.withAlpha(30),
                  borderRadius: BorderRadiusGeometry.circular(16),
                  border: BoxBorder.all(color: color, width: 2,),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Health Advice",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "Maintain Healthy LifeStyle",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: .w400,
                      ),
                    ),
                  ],
                ),
              ),


               Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: color.withAlpha(30),
                    borderRadius: BorderRadiusGeometry.circular(16),
                    border: BoxBorder.all(color: color, width: 2,),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(
                        "BMI Categories",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: .bold,
                        ),
                      ),

                      WeightInfoItemRow(color: getColor(17.5),status: getStatus(17.5),value: "< 18.5",),
                      WeightInfoItemRow(color: getColor(24),status: getStatus(24),value: "18.5 - 24.9",),
                      WeightInfoItemRow(color: getColor(29),status: getStatus(29),value: "25 - 29.9",),
                      WeightInfoItemRow(color: getColor(33),status: getStatus(33),value: "+30",),

                    ],
                  ),
                ),


              Row(
                spacing: 16,
                children: [
                Button(color: Colors.deepPurple,title: "Back",press: (){
                  Navigator.pop(context);
                },),

                Button(color: Colors.indigo,title: "Recalculate",press: (){
                    Navigator.pop(context);
                  },),

                ],),

            ],
          ),
        ),
      ),
    );
  }
}
