import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'Custom button widget.dart';
import 'Title widget (Providor<>  Practice).dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
        ),
        home: const ScoreScreen(),
      ),
    ),
  );
}

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State {
  int scoreL1 = 0;
  int scoreL2 = 0;
  int scoreL3 = 0;
  int scoreL4 = 0;
  int scoreAlgae = 0;
  int netScore = 0;
  final double textSpace = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appTitleWidget()),
      body: Center(
        child: Column(
              children: [
                ScoreButtons(
                  label: 'Score L1: $scoreL1',
                  buttonColor: Colors.green,
                  onAdd: () {
                    setState(() {
                      scoreL1++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      scoreL1--;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L2: $scoreL2',
                  buttonColor: Colors.green,
                  onAdd: () {
                    setState(() {
                      scoreL2++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      scoreL2--;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L3: $scoreL3',
                  buttonColor: Colors.green,
                  onAdd: () {
                    setState(() {
                      scoreL3++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      scoreL3--;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L4: $scoreL4',
                  buttonColor: Colors.green,
                  onAdd: () {
                    setState(() {
                      scoreL4++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      scoreL4--;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Algae $scoreAlgae',
                  buttonColor: Colors.purple,
                  onAdd: () {
                    setState(() {
                      scoreAlgae++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      scoreAlgae--;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Net Score $netScore',
                  buttonColor: Colors.blue,
                  onAdd: () {
                    setState(() {
                      netScore++;
                    });
                  },
                  onSubtract: (){
                    setState(() {
                      netScore--;
                    });
                  },
                ),
              ],
        ),
      ),
    );
  }
}


// Column(
// children: [
// SizedBox(height: 7.5),
// Text('Score L1: $scoreL1',
// style: TextStyle(fontSize: 35)),
// SizedBox(height: textSpace),
// Text('Score L2: $scoreL2',
// style: TextStyle(fontSize: 35)),
// SizedBox(height: textSpace),
// Text('Score L3: $scoreL3',
// style: TextStyle(fontSize: 35)),
// SizedBox(height: textSpace),
// Text('Score L4: $scoreL4',
// style: TextStyle(fontSize: 35)),
// SizedBox(height: textSpace),
// Text('Algae: $scoreAlgae',
// style: TextStyle(fontSize: 35)),
// SizedBox(height: textSpace),
// Text('Net Score: $netScore',
// style: TextStyle(fontSize: 35)),
// ],
// ), // Score:
// SizedBox(width: 30),
// Column(
// children: [
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// scoreL1++;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// scoreL2++;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// scoreL3++;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// scoreL4++;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.purple,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// scoreAlgae++;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.blue,
// selectSymbol: Icons.add,
// onPressed: () {
// setState(() {
// netScore++;
// });
// },
// ),
// SizedBox(height: 20,),
// ],
// ), // + buttons
// SizedBox(width: 20),
// Column(
// children: [
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// scoreL1--;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// scoreL2--;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// scoreL3--;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.orange,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// scoreL4--;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.purple,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// scoreAlgae--;
// });
// },
// ),
// SizedBox(height: 20,),
// ScoreButtons(
// buttonColor: Colors.blue,
// selectSymbol: Icons.remove,
// onPressed: () {
// setState(() {
// netScore--;
// });
// },
// ),
// ],
// ), // - button