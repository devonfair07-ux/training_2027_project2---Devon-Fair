import 'package:flutter/material.dart';

void main() {
  int scored = 1;
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Reefscape Scouting')),
        body: Center(
            child: Column (
              children: [
                Text('Scouting Practice'),
                SizedBox(height: 50),
                Text('Team 2046'),
                Row(
                  mainAxisSize:
                  MainAxisSize.min,
                  children: [
                    Text('Coral Scored: $scored'),
                    SizedBox(width: 80),
                    ElevatedButton(onPressed: (){
                      scored++;
                    }, child: Text('+'))
                  ]
                ),
                ElevatedButton(onPressed: (){}, child: Text('Submit')),
              ]
            )
        ),
      ),
    ),
  );
}