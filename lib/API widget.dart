import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/API%20key%20providor.dart';
import 'package:training_2027_project2/Screens/ScoutEnterTeam.dart';
import 'package:training_2027_project2/Team%20Select%20SegmentedButton.dart';

class teamNumber extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final teamNumberProvidor =  NotifierProvider<teamNumber, String>(() {
  return teamNumber();
});



final matchProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final matchNumber = ref.watch(matchNumberProvidor);
  final matchKey = '2026okok_qm$matchNumber';

  final response = await http.get(
    Uri.parse('https://www.thebluealliance.com/api/v3/match/$matchKey'),
    headers: {'X-TBA-Auth-Key': ref.watch(tbaApiKeyProvider)},
  );

  if(response.statusCode != 200){
    throw Exception('Failed to Load Matches');
  }

  return jsonDecode(response.body) as Map<String, dynamic>;
});



class teamNumberAPI extends ConsumerWidget {
  final String additionalText;
  const teamNumberAPI({required this.additionalText, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesData = ref.watch(matchProvider);
    final matchNumber = ref.watch(matchNumberProvidor);
    final teamPosition = ref.watch(segmentProvidor);

    if (matchNumber.trim().isEmpty) {
      return const Text('Enter a match number');
    }

    if(int.tryParse(matchNumber) !> 77 || int.tryParse(matchNumber) !< 1){
      return Text('Invalid match number');
    }

    return matchesData.when(
      data: (data) {
        final parts = teamPosition.split(' ');
        final alliance = parts[0].toLowerCase();
        final teamIndex = int.parse(parts[1]) - 1;
        final teamKeys =
        data['alliances'][alliance]['team_keys'] as List<dynamic>;

        final number = int.tryParse(teamKeys[teamIndex].toString().replaceFirst('frc', ''));
        (number) => ref.read(teamNumberProvidor.notifier).updateText(number);

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