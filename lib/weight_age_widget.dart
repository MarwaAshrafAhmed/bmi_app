import 'package:flutter/material.dart';

class WeightAgeWidget extends StatelessWidget {
  const WeightAgeWidget({super.key,required this.title,required this.value,required this.onAdd,required this.onRemove});

  final String title;
  final double value;
  final void Function()? onAdd;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        child: Column(
          spacing: 16,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: .w500,
              ),
            ),

            Text(

              "${value.toInt()} cm",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: .w500,
              ),
            ),

            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                FloatingActionButton(onPressed: onAdd,mini: true,backgroundColor: Colors.deepPurple,shape: CircleBorder(),child: Icon(Icons.add,color: Colors.white,),),
                FloatingActionButton(onPressed: onRemove,mini: true,backgroundColor: Colors.deepPurple,shape: CircleBorder(),child: Icon(Icons.remove,color: Colors.white,),),

              ],
            )

          ],
        ),
      ),
    );
  }
}
