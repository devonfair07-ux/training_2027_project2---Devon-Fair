import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchNumberNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final matchNumberProvidor = NotifierProvider<MatchNumberNotifier, String>(() {
  return MatchNumberNotifier();
});