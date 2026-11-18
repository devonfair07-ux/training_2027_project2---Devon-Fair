import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeamNumber extends Notifier<String> {
  @override
  String build() => '';

  void updateText(String value) {
    state = value;
  }
}

final teamNumberProvidor =  NotifierProvider<TeamNumber, String>(() {
  return TeamNumber();
});
