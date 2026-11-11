import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as ref;
import 'package:training_2027_project2/API%20widget.dart';

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
            SizedBox(height: 10,),
            Row(
              Text()
            ),
          ],
        ),
      ),
    );
  }
}
