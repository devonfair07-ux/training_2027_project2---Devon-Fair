import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/API%20widget.dart';

import '../Robots class & list.dart';


class ScoreScreen extends ConsumerStatefulWidget {
  const ScoreScreen({super.key});

  @override
  ConsumerState<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends ConsumerState<ScoreScreen> {
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 250), // Space from left edge
                SizedBox(
                  width: 200,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Currently Scouting:',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ), // Text: Currently Scouting:
                SizedBox(height: 20), // Spacer
                teamNumberAPI(additionalText: ''), // Team number
                SizedBox(height: 80,),
                SizedBox(
                  width: 200.0,
                  height: 70.0,
                  child: ElevatedButton(
                    onPressed: (){
                      robot.add(
                          Robots(
                          L1: scoreL1, L2: scoreL2, L3: scoreL3, L4: scoreL4, algae: scoreAlgae, net: netScore));
                      context.go('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text('Save to Reefscout', style: const TextStyle(fontSize: 20),),
                  ),
                ), // plus button
              ],
            ), // Currently scouting:  and submit button
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreButtons(
                  label: 'Score L1: $scoreL1',
                  onAdd: () {
                    setState(() {
                      if (scoreL1 < 11) {
                        scoreL1++;
                      }
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (scoreL1 > 0) {
                        scoreL1--;
                      }
                      ;
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L2: $scoreL2',
                  onAdd: () {
                    setState(() {
                      if (scoreL2 < 11) {
                        scoreL2++;
                      }
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (scoreL2 > 0) {
                        scoreL2--;
                      }
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L3: $scoreL3',
                  onAdd: () {
                    setState(() {
                      if (scoreL3 < 11) {
                        scoreL3++;
                      }
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (scoreL3 > 0) {
                        scoreL3--;
                      }
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Score L4: $scoreL4',
                  onAdd: () {
                    setState(() {
                      if (scoreL4 < 11) {
                        scoreL4++;
                      }
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (scoreL4 > 0) {
                        scoreL4--;
                      }
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Algae Score: $scoreAlgae',
                  onAdd: () {
                    setState(() {
                      scoreAlgae++;
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (scoreAlgae > 0) {
                        scoreAlgae--;
                      }
                    });
                  },
                ),
                ScoreButtons(
                  label: 'Net Score: $netScore',
                  onAdd: () {
                    setState(() {
                      netScore++;
                    });
                  },
                  onSubtract: () {
                    setState(() {
                      if (netScore > 0) {
                        netScore--;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreButtons extends StatelessWidget {
  final String label;
  final VoidCallback onSubtract;
  final VoidCallback onAdd;

  const ScoreButtons({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: Text(
            '$label',
            style: const TextStyle(fontSize: 35),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 20),
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
            ),
            child: Icon(Icons.add),
          ),
        ), // plus button
        SizedBox(width: 5, height: 75),
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
            ),
            child: Icon(Icons.remove),
          ),
        ), // minus button
        SizedBox(width: 20), // space from right wall
      ],
    );
  }
}

