import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/Screens/scout_enter_team.dart';
import 'package:training_2027_project2/team_select_segmented_button.dart';

import 'API_key_providor.dart';

class TeamNumber extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final teamNumberProvidor =  NotifierProvider<TeamNumber, String>(() {
  return TeamNumber();
});



final matchProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final matchNumber = ref.watch(matchNumberProvidor).trim();
  final matchKey = '2025camb_qm$matchNumber';

  final response = await http.get(
    Uri.parse('https://www.thebluealliance.com/api/v3/match/$matchKey'),
    headers: {'X-TBA-Auth-Key': ref.watch(tbaApiKeyProvider)},
  );

  if(response.statusCode != 200){
    throw Exception('Failed to Load Matches');
  }

  return jsonDecode(response.body) as Map<String, dynamic>;
});



class TeamNumberAPI extends ConsumerWidget {
  final String additionalText;
  const TeamNumberAPI({required this.additionalText, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchNumberText = ref.watch(matchNumberProvidor).trim();

    if (matchNumberText.isEmpty) {
      return const Text('Enter a match number');
    }

    final matchNumber = int.tryParse(matchNumberText);
    if (matchNumber == null || matchNumber < 1 || matchNumber > 70) {
      return const Text('Invalid match number');
    }

    final teamPosition = ref.watch(segmentProvidor);
    final matchesData = ref.watch(matchProvider);

    return matchesData.when(
      data: (data) {
        final parts = teamPosition.split(' ');
        final alliance = parts[0].toLowerCase();
        final teamIndex = int.parse(parts[1]) - 1;
        final teamKeys =
        data['alliances'][alliance]['team_keys'] as List<dynamic>;

        final number = int.tryParse(teamKeys[teamIndex].toString().replaceFirst('frc', ''));

        if(number != null){
          return Text(
            '$additionalText $number',
            style: const TextStyle(fontSize: 35),
            textAlign: TextAlign.center,
          );
        }
        return Text('Invalid match number',);

      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
