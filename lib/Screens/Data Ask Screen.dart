import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class matchNumberSelectNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final matchNumberSelectProvidor =
    NotifierProvider<matchNumberSelectNotifier, String>(() {
      return matchNumberSelectNotifier();
    });

class DataAskScreen extends ConsumerWidget {
  const DataAskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Text(
                'Select a team',
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 200,
              height: 75,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Team Number:',
                  hintText: 'Enter a team number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => ref
                    .read(matchNumberSelectProvidor.notifier)
                    .updateText(value),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/teamData');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text('Next', style: const TextStyle(fontSize: 22)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
