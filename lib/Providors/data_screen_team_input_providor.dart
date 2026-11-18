import 'package:flutter_riverpod/flutter_riverpod.dart';

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

