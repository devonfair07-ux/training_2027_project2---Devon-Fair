import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class ScoreButtons extends StatelessWidget {
  final Color buttonColor;
  final IconData selectSymbol;

  const ScoreButtons({
    super.key,
    required this.buttonColor,
    required this.selectSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: buttonColor,
        ),
        child: Icon(selectSymbol, color: Colors.white),
      ),
    );
  }
}