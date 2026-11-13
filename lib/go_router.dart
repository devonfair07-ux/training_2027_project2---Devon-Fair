import 'package:flutter/material.dart' as go_router;
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/Screens/scout_enter_team.dart';

import 'Screens/all_data_screen.dart';
import 'Screens/specific_data_screen.dart';
import 'Screens/data_ask_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/score_screen.dart';

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          BottomBar(location: state.uri.path, child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/teamNumber',
          builder: (context, state) => const Scoutenterteam(),
        ),
        GoRoute(
          path: '/teamScoring',
          builder: (context, state) => const ScoreScreen(),
        ),
        GoRoute(
          path: '/teamDataAsk',
          builder: (context, state) => const DataAskScreen(),
        ),
        GoRoute(
          path: '/PickData',
          builder: (context, state) => const SpecificDataScreen(),
        ),
        GoRoute(
          path: '/AllData',
          builder: (context, state) => const AllDataScreen(),
        ),
      ],
    ),
  ],
);

class RouterWidget extends go_router.StatelessWidget {
  const RouterWidget({super.key});

  @override
  go_router.Widget build(go_router.BuildContext context) {
    return go_router.MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: go_router.ThemeData.from(
        colorScheme: go_router.ColorScheme.fromSeed(
          seedColor: go_router.Colors.purple,
        ),
      ),
    );
  }
}

class BottomBar extends go_router.StatelessWidget {
  const BottomBar({required this.location, required this.child, super.key});

  final String location;
  final go_router.Widget child;

  @override
  go_router.Widget build(go_router.BuildContext context) {
    final selectedIndex = switch (location) {
      '/PickData' => 2,
      '/AllData' => 2,
      '/teamScoring' => 1,
      '/teamNumber' => 1,
      '/teamDataAsk' => 2,
      '/home' => 0,
      _ => 0,
    };

    return go_router.Scaffold(
      body: child,
      bottomNavigationBar: go_router.NavigationBar(
        selectedIndex: selectedIndex,
        indicatorColor: go_router.Colors.amber,
        onDestinationSelected: (index) {
          final location = switch (index) {
            0 => '/home',
            1 => '/teamNumber',
            2 => '/teamDataAsk',
            _ => '/home',
          };
          context.go(location);
        },
        destinations: const [
          go_router.NavigationDestination(
            icon: go_router.Icon(go_router.Icons.home_outlined),
            label: 'Home',
          ),
          go_router.NavigationDestination(
            icon: go_router.Icon(go_router.Icons.search),
            label: 'Scouting',
          ),
          go_router.NavigationDestination(
            icon: go_router.Icon(go_router.Icons.storage),
            label: 'Data Storage',
          ),
        ],
      ),
    );
  }
}
