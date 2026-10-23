import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'Custom button widget.dart';
import 'Title widget (Providor<>  Practice).dart';



void main() {
  int scored = 1;
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
        ),
        home: Scaffold(
          appBar: AppBar(title: appTitleWidget()),
          body: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Score L1'),
                    SizedBox(height: 60),
                    Text('Score L2'),
                    SizedBox(height: 60),
                    Text('Score L3'),
                    SizedBox(height: 60),
                    Text('Score L4'),
                    SizedBox(height: 60),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    ScoreButtons(
                      buttonColor: Colors.red,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.orange,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.green,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.blue,
                      selectSymbol: Icons.add,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    ScoreButtons(
                      buttonColor: Colors.red,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.orange,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.green,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.blue,
                      selectSymbol: Icons.remove,
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text('Score L1'),
                    SizedBox(height: 60),
                    Text('Score L2'),
                    SizedBox(height: 60),
                    Text('Score L3'),
                    SizedBox(height: 60),
                    Text('Score L4'),
                    SizedBox(height: 60),
                  ],
                ),
                SizedBox(width: 30),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}





class score extends Notifier<int> {
  @override
  int build() => 0;

  void decrease() {
    state++;
  }

  void increace() {
    state--;
  }
}
