import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DataAskScreen extends ConsumerStatefulWidget {
  const DataAskScreen({super.key});

  @override
  ConsumerState<DataAskScreen> createState() => _DataAskScreenState();
}

class TeamInputNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String newText) {
    state = newText;
  }

  void clearText() {
    state = '';
  }
}

final teamInputProvider = NotifierProvider<TeamInputNotifier, String>(
  TeamInputNotifier.new,
);

class _DataAskScreenState extends ConsumerState<DataAskScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // start controller with the  provider state
    final initialText = ref.read(teamInputProvider);
    _controller = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    //  dispose the controller when the widget ends
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  watch  provider state for updates

    // look for state changes to update controller
    ref.listen<String>(teamInputProvider, (previous, next) {
      if (_controller.text != next) {
        _controller.value = TextEditingValue(
          text: next,
          selection: TextSelection.collapsed(offset: next.length),
        );
      }
    });

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
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Team Number:',
                  hintText: 'Enter a team number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  ref.read(teamInputProvider.notifier).updateText(value);
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: int.tryParse(ref.watch(teamInputProvider)) != null
                    ? () {
                        context.go('/teamData');
                      }
                    : null,
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
