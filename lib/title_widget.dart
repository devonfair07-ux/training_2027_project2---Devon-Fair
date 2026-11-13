import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appTitle = Provider<String>((ref) {
  return 'Reefscout';
});

class AppTitleWidget extends ConsumerWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(appTitle);
    return Text(title, style: const TextStyle(fontSize: 30));
  }
}
