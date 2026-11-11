import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as ref;
import 'package:training_2027_project2/API%20widget.dart';
import 'package:training_2027_project2/Robots%20class%20&%20list.dart';

class dataScreen extends StatelessWidget {
  const dataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: teamNumberAPI(additionalText: 'Team:'),
            ),
            SizedBox(height: 10),
            Row(
                children: [
                  displayData(),
                ]
            ),
          ],
        ),
      ),
    );
  }
}

// class displayData extends StatelessWidget{
//   const displayData({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final teamNumber = ref.watch(teamNumberProvidor);
//     for (Robot info in robots) {
//       if (info.teamNumber == teamNumber) {
//         print('Selected team number: ${info.teamNumber}');
//         print('Hot Dogs Eaten: ${info.hotDogsEaten}');
//         print('Hamburbers Eaten: ${info.hamburgersEaten}');
//         print('Total Eaten: ${info.hamburgersEaten+info.hotDogsEaten}');
//         print('Notes: ${info.notes}');
//       }else{
//         print('No teams found$reset');
//       }
//     }
//   }
// }

class displayData extends ConsumerWidget {
  const displayData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamNumber = ref.watch(teamNumberProvidor);
    return Text(teamNumber);
  }
}