import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:training_2027_project2/Data%20Screen.dart';
import 'package:training_2027_project2/Screens/ScoutEnterTeam.dart';

final matchProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final matchNumber = matchNumberProvidor;
  final response = await http.get(
    Uri.parse(
      'https://www.thebluealliance.com/api/v3/event/$selectedEvent/teams',
    ),
    headers: {'X-TBA-Auth-Key': ref.watch(tbaApiKeyProvider)},
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

    return matches.when(
      data: (data) => Text(
        data['alliances']['blue']['team_keys'][0]
            .toString()
            .replaceFirst('frc', ''),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}