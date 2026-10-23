import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final appTitle = Provider<String>((ref) {
  return 'Reefscape scouting';
});

class appTitleWidget extends ConsumerWidget {
  const appTitleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(appTitle);
    return Text(title);
  }
}