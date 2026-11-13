
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome to Reefscout', style: TextStyle(fontSize: 35), textAlign: TextAlign.center,),
            SizedBox(height: 60,),
            Text('Start scouting to begin \ngathering data', style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            SizedBox(
              width: 250.0,
              height: 75.0,
              child: ElevatedButton(
                onPressed: (){context.go('/teamNumber');},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text('Start Scouting', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: 175.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: (){context.go('/teamDataAsk');},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text('Collected Data', style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
