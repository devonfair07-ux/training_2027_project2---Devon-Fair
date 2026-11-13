import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/Screens/scout_enter_team.dart';
import 'Screens/data_screen.dart';
import 'Screens/data_ask_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/score_screen.dart';

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => BottomBar(
        location: state.uri.path,
        child: child,
      ),
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
          path: '/teamData',
          builder: (context, state) => const dataScreen(),
        ),
      ],
    ),
  ],
);

class RouterWidget extends StatelessWidget {
  const RouterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.location,
    required this.child,
    super.key,
  });

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = switch (location) {
      '/home' => 0,
      '/teamDataAsk' => 2,
      '/teamData' => 2,
      '/teamNumber' => 1,
      _ => 0,
    };

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        indicatorColor: Colors.amber,
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
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Scouting',
          ),
          NavigationDestination(
            icon: Icon(Icons.storage),
            label: 'Data Storage',
          ),
        ],
      ),
    );
  }
}
