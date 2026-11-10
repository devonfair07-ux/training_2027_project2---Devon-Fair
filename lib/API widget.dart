import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/Data%20Screen.dart';
import 'package:training_2027_project2/Screens/ScoutEnterTeam.dart';
import 'package:training_2027_project2/Team%20Select%20SegmentedButton.dart';



final matchProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final matchNumber = ref.watch(matchNumberProvidor);
  final matchKey = '2026okok_qm$matchNumber';

  final response = await http.get(
    Uri.parse('https://www.thebluealliance.com/api/v3/match/$matchKey'),
    headers: {'X-TBA-Auth-Key': '1vCNQIOE0iupTWaAeMGOmlE3e3tXPfAHx4nYT5mJ7YbUI9frqeonJ5oRYTavJM2K'},
  );

  if(response.statusCode != 200){
    throw Exception('Failed to Load Matches');
  }

  return jsonDecode(response.body) as Map<String, dynamic>;
});



class teamSelectPage extends ConsumerWidget {
  const teamSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(matchProvider);
    final matchNumber = ref.watch(matchNumberProvidor);
    final teamPosition = ref.watch(segmentProvidor);
    if (matchNumber.trim().isEmpty) {
      return const Text('Enter a match number');
    }

    return matches.when(
      data: (data) {
        final parts = teamPosition.split(' ');
        final alliance = parts[0].toLowerCase();
        final teamIndex = int.parse(parts[1]) - 1;
        final teamKeys =
        data['alliances'][alliance]['team_keys'] as List<dynamic>;

        return Text(teamKeys[teamIndex].toString().replaceFirst('frc', ''));
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}