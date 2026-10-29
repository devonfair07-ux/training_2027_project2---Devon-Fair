import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'Score Counter.dart';
import 'Title widget (Providor<>  Practice).dart';

class ScoreButtons extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final VoidCallback onSubtract;
  final VoidCallback onAdd;

  const ScoreButtons({
    super.key,
    required this.buttonColor,
    required this.onAdd,
    required this.onSubtract,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 300,
            child: Text(
                '$label',
                style: const TextStyle(
                    fontSize: 35),
          textAlign: TextAlign.right)
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 70.0,
          height: 70.0,
          child: ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.zero,
              backgroundColor: buttonColor,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        SizedBox(width: 5,height: 75,),
        SizedBox(
          width: 70.0,
          height: 70.0,
          child: ElevatedButton(
            onPressed: onSubtract,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.zero,
              backgroundColor: buttonColor,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}


//-------------------------------------------------------------------


