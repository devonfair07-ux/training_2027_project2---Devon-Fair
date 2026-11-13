import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../team_data_providor.dart';
import 'data_ask_screen.dart';

class AllDataScreen extends ConsumerWidget {
  const AllDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissions = ref.watch(eventScoresProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Teams:'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/teamDataAsk'),
        ),
      ),
      body: submissions.isEmpty
          ? Center(
              child: Column(
                children: [
                  const Text('No saved scouting data yet'),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/teamDataAsk');
                    },
                    child: const Icon(Icons.keyboard_return),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: submissions.length,
              itemBuilder: (context, index) {
                final robot = submissions[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      'Team ${robot.teamNumber} — Match ${robot.matchNumber}',
                    ),
                    subtitle: Text(
                      '${robot.eventName}\n'
                      'L1: ${robot.scoreL1}  L2: ${robot.scoreL2}  '
                      'L3: ${robot.scoreL3}  L4: ${robot.scoreL4}\n'
                      'Algae: ${robot.scoreAlgae}  Net: ${robot.netScore}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
