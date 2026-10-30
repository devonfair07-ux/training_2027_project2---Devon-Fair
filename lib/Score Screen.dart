import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom + - Scoring.dart';
import 'Title widget (Providor<>  Practice).dart';

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
                  if(scoreL1 >11) {
                    scoreL1++;
                  }
                });
              },
              onSubtract: (){
                setState(() {
                  if(scoreL1 > 0){
                    scoreL1--;
                  };
                });
              },
            ),
            ScoreButtons(
              label: 'Score L2: $scoreL2',
              buttonColor: Colors.green,
              onAdd: () {
                setState(() {
                  if(scoreL2 > 11) {
                    scoreL2++;
                  }
                });
              },
              onSubtract: (){
                setState(() {
                  if(scoreL2 > 0) {
                    scoreL2--;
                  }
                });
              },
            ),
            ScoreButtons(
              label: 'Score L3: $scoreL3',
              buttonColor: Colors.green,
              onAdd: () {
                setState(() {
                  if(scoreL3 > 11) {
                    scoreL3++;
                  }
                });
              },
              onSubtract: (){
                setState(() {
                  if(scoreL3 > 0) {
                    scoreL3--;
                  }
                });
              },
            ),
            ScoreButtons(
              label: 'Score L4: $scoreL4',
              buttonColor: Colors.green,
              onAdd: () {
                setState(() {
                  if(scoreL4 > 11) {
                    scoreL4++;
                  }
                });
              },
              onSubtract: (){
                setState(() {
                  if(scoreL4 > 0) {
                    scoreL4--;
                  }
                });
              },
            ),
            ScoreButtons(
              label: 'Algae Score: $scoreAlgae',
              buttonColor: Colors.purple,
              onAdd: () {
                setState(() {
                    scoreAlgae++;
                });
              },
              onSubtract: (){
                setState(() {
                  if(scoreAlgae > 0) {
                    scoreAlgae--;
                  }
                });
              },
            ),
            ScoreButtons(
              label: 'Net Score: $netScore',
              buttonColor: Colors.blue,
              onAdd: () {
                setState(() {
                    netScore++;
                });
              },
              onSubtract: (){
                setState(() {
                  if(netScore > 0){
                    netScore--;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

