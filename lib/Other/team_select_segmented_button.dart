import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SegmentNotifier extends Notifier<String> {
  @override
  String build() => 'Blue 1';

  void updateText(String value) {
    state = value;
  }
}

final segmentProvidor = NotifierProvider<SegmentNotifier, String>(() {
  return SegmentNotifier();
});

class TeamSegmentedButton extends ConsumerStatefulWidget {
  const TeamSegmentedButton({super.key});

  @override
  ConsumerState<TeamSegmentedButton> createState() =>
      _TeamSegmentedButtonState();
}

class _TeamSegmentedButtonState extends ConsumerState<TeamSegmentedButton> {
  Set<String> selectedTeams = {'Blue 1'};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(
          value: 'Blue 1',
          label: Text('Blue 1', style: TextStyle(color: Colors.blue)),
        ),
        ButtonSegment(
          value: 'Blue 2',
          label: Text('Blue 2', style: TextStyle(color: Colors.blue)),
        ),
        ButtonSegment(
          value: 'Blue 3',
          label: Text('Blue 3', style: TextStyle(color: Colors.blue)),
        ),
        ButtonSegment(
          value: 'Red 1',
          label: Text('Red 1', style: TextStyle(color: Colors.red)),
        ),
        ButtonSegment(
          value: 'Red 2',
          label: Text('Red 2', style: TextStyle(color: Colors.red)),
        ),
        ButtonSegment(
          value: 'Red 3',
          label: Text('Red 3', style: TextStyle(color: Colors.red)),
        ),
      ],
      selected: selectedTeams,
      onSelectionChanged: (selection) {
        setState(() => selectedTeams = selection);
        ref.watch(segmentProvidor.notifier).updateText(selection.first);
      },
    );
  }
}