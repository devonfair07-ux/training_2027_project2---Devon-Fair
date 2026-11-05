import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2027_project2/ScoutEnterTeam.dart';
import 'package:training_2027_project2/Screens/Home%20Screen.dart';
import 'package:training_2027_project2/Score%20Screen.dart';

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
    final selectedIndex = location == '/home' ? 0 : 1;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        indicatorColor: Colors.amber,
        onDestinationSelected: (index) {
          context.go(index == 0 ? '/home' : '/teamNumber');
        },
        destinations: const [
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
    );
  }
}
