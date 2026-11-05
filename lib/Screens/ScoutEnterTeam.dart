import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TeamNumberNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final teamNumberProvidor = NotifierProvider<TeamNumberNotifier, String>(() {
  return TeamNumberNotifier();
});



class Scoutenterteam extends ConsumerWidget {
  const Scoutenterteam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userAnswer = ref.watch(teamNumberProvidor);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: Text(
              'What team are you scouting?',
              style: const TextStyle(
                  fontSize: 35),textAlign: TextAlign.center),
        ),
        SizedBox(
          width: 200,
          height: 75,
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Team Number:',
              hintText: 'Enter a team number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => ref.read(teamNumberProvidor.notifier).updateText(value),
          ),
        ),
        SizedBox(
          width: 200,
          height: 75,
          child: ElevatedButton(
            onPressed: _userAnswer.trim().isEmpty
                ? null // Disables the button and grays it out when empty
                : () {
              context.go('/teamScoring');
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Icon(Icons.navigate_next_outlined, size: 45),
          ),
        ),
      ],
    );
  }
}