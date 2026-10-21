import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final AppTitle = Provider<String>((ref) {
  return 'Reefscape scouting';
});

void main() {
  int scored = 1;
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.yellow), // Theme
        ),
        home: Scaffold(
          appBar: AppBar(title: appTitle()),
          body: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Score L1'),
                      SizedBox(height: 60),
                      Text('Score L2'),
                      SizedBox(height: 60),
                      Text('Score L3'),
                      SizedBox(height: 60),
                      Text('Score L4'),
                      SizedBox(height: 60),
                    ]),
                SizedBox(width: 30,),
                Column(
                  children: [
                    ScoreButtons(
                      buttonColor: Colors.red,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.orange,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.green,
                      selectSymbol: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.blue,
                      selectSymbol: Icons.add,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    ScoreButtons(
                      buttonColor: Colors.red,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.orange,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.green,
                      selectSymbol: Icons.remove,
                    ),
                    SizedBox(height: 20),
                    ScoreButtons(
                      buttonColor: Colors.blue,
                      selectSymbol: Icons.remove,
                    ),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Score L1'),
                      SizedBox(height: 60),
                      Text('Score L2'),
                      SizedBox(height: 60),
                      Text('Score L3'),
                      SizedBox(height: 60),
                      Text('Score L4'),
                      SizedBox(height: 60),
                    ]),
                SizedBox(width: 30,),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class ScoreButtons extends StatelessWidget {
  final Color buttonColor;
  final IconData selectSymbol;

  const ScoreButtons({
    super.key,
    required this.buttonColor,
    required this.selectSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: buttonColor,
        ),
        child: Icon(selectSymbol, color: Colors.white),
      ),
    );
  }
}

class appTitle extends ConsumerWidget {
  const appTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(AppTitle);
    return Text(title);
  }
}

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return
      0;
  }

  void increase() {
    state++;
  }

  void decrease(){
    state--;
  }
}