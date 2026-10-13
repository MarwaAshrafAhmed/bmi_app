import 'package:bmi_app/bmi_res_view.dart';
import 'package:bmi_app/gender_widget.dart';
import 'package:bmi_app/weight_age_widget.dart';
import 'package:bmi_app/weight_info_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 173;
  double weight = 60;
  double age = 20;

   double bmiRes(double height, double weight) {
    double res = weight / ((height / 100) * (height / 100));
    return res;
  }

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 24,
          children: [
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                WeightInfoItem(
                  color: getColor(17.5),
                  status: getStatus(17.5),
                  value: "< 18.5",
                ),
                WeightInfoItem(
                  color: getColor(24),
                  status: getStatus(24),
                  value: "18.5 - 24.9",
                ),
                WeightInfoItem(
                  color: getColor(28),
                  status: getStatus(28),
                  value: "25 - 29.9",
                ),
                WeightInfoItem(
                  color: getColor(33),
                  status: getStatus(33),
                  value: "+30",
                ),
              ],
            ),

            Row(
              spacing: 8,
              children: [
                GenderWidget(
                  icon: Icons.male,
                  gender: "Male",
                  isActive: isMale,
                  tap: () {
                    isMale = true;
                    setState(() {});
                  },
                ),
                GenderWidget(
                  icon: Icons.female,
                  gender: "Female",
                  isActive: !isMale,
                  tap: () {
                    isMale = false;
                    setState(() {});
                  },
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(40),
              width: .infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: .w500,
                    ),
                  ),

                  Text(
                    "${height.toInt()} cm",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: .w500,
                    ),
                  ),

                  SliderTheme(
                    data: SliderThemeData(trackHeight: 6),
                    child: Slider(
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.white,
                      value: height,
                      onChanged: (value) {
                        height = value;
                        setState(() {});
                      },
                      min: 50,
                      max: 250,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              spacing: 8,
              children: [
                WeightAgeWidget(
                  title: "Weight",
                  value: weight,
                  onAdd: () {
                    weight++;
                    setState(() {});
                  },
                  onRemove: () {
                    weight--;
                    setState(() {});
                  },
                ),

                WeightAgeWidget(
                  title: "Age",
                  value: age,
                  onAdd: () {
                    age++;
                    setState(() {});
                  },
                  onRemove: () {
                    age--;
                    setState(() {});
                  },
                ),
              ],
            ),

            SizedBox(
              width: .infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(4),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  double bmiResult = bmiRes(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiResView(
                          bmiRes: bmiResult,
                          color: getColor(bmiResult),
                          status: getStatus(bmiResult),
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
