import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Robots class & list.dart';


class EventScoresNotifier extends Notifier<List<ScoreSubmission>> {
  @override
  List<ScoreSubmission> build() {
    return [];
  }

  void submit(ScoreSubmission submission) {
    final existingIndex = state.indexWhere(
      (saved) =>
          saved.eventName == submission.eventName &&
          saved.teamNumber == submission.teamNumber &&
          saved.matchNumber == submission.matchNumber,
    );
    if (existingIndex == -1) {
      state = [...state, submission];
    } else {
      final updatedSubmissions = [...state];
      updatedSubmissions[existingIndex] = submission;
      state = updatedSubmissions;
    }
  }
}

final eventScoresProvider =
    NotifierProvider<EventScoresNotifier, List<ScoreSubmission>>(
      EventScoresNotifier.new,
    );

