import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'Custom + - Scoring.dart';
import 'Home Screen.dart';
import 'Score Screen.dart';
import 'Title widget (Providor<>  Practice).dart';

import 'package:go_router/go_router.dart';

void main() => runApp(
  const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationExample(),
    ),
  ),
);



class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.kebab_dining_outlined),
            label: 'Scouting',
          ),
        ],
      ),
      body: <Widget>[HomeScreen(), ScoreScreen()][currentPageIndex],
    );
  }
}
