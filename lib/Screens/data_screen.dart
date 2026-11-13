import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../team_data_providor.dart';
import 'data_ask_screen.dart';

class dataScreen extends ConsumerWidget {
  const dataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamNumber = ref.watch(TeamInputProvider).trim();
    final submissions = ref
        .watch(eventScoresProvider)
        .where((submission) => submission.teamNumber == teamNumber)
        .toList();
    return Scaffold(
      body: teamNumber.isEmpty
          ? Center(child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter a Team Number First', style: TextStyle(fontSize: 40)),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
              width: 80,
              child: ElevatedButton(
                  onPressed: (){
                    context.go('/teamDataAsk');
                  },
                  child: Icon(Icons.keyboard_return,size: 20,)),
            )
          ]
      ),
      )
          : submissions.isEmpty
              ? Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('No Submissions For This Team', style: TextStyle(fontSize: 40)),
              SizedBox(height: 20,),
              SizedBox(
                height: 40,
                width: 80,
                child: ElevatedButton(
                    onPressed: (){
                      context.go('/teamDataAsk');
                    },
                    child: Icon(Icons.keyboard_return,size: 20,)),
              )
            ]
        ),
      )
              : ListView.builder(
                  itemCount: submissions.length,
                  itemBuilder: (context, index) {
                    final robot = submissions[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          'Team ${robot.teamNumber} — Match ${robot.matchNumber}', style: TextStyle(fontSize: 40),
                        ),
                        subtitle: Text(
                          '${robot.eventName}\n'
                          'L1: ${robot.scoreL1}  L2: ${robot.scoreL2}  '
                          'L3: ${robot.scoreL3}  L4: ${robot.scoreL4}\n'
                          'Algae: ${robot.scoreAlgae}  Net: ${robot.netScore}', style: TextStyle(fontSize: 25)
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
    );
  }
}
