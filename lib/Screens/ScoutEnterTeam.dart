import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/Team%20Select%20SegmentedButton.dart';

import '../API widget.dart';

class MatchNumberNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final matchNumberProvidor = NotifierProvider<MatchNumberNotifier, String>(() {
  return MatchNumberNotifier();
});

class Scoutenterteam extends ConsumerWidget {
  const Scoutenterteam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: Text(
            'What match are you scouting?',
            style: const TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(
          width: 200,
          height: 75,
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Match Number:',
              hintText: '#1 - 77',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) =>
                ref.read(matchNumberProvidor.notifier).updateText(value),
          ),
        ),

        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ref.invalidate(matchProvider);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Text('Next', style: const TextStyle(fontSize: 22)),
          ),
        ),
        SizedBox(height: 20),
        TeamSegmentedButton(),
        teamSelectPage(),
      ],
    );
  }
}
