import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});

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
                'Select a match',
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 200,
              height: 75,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Match Number:',
                  hintText: 'Enter a match number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => ref
                    .read(matchNumberSelectProvidor.notifier)
                    .updateText(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
