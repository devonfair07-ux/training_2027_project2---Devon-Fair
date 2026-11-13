class ScoreSubmission {
  String teamNumber;
  String eventName;
  String matchNumber;
  int scoreL1;
  int scoreL2;
  int scoreL3;
  int scoreL4;
  int scoreAlgae;
  int netScore;

  ScoreSubmission({
    required this.eventName,
    required this.matchNumber,
    required this.teamNumber,
    required this.scoreL1,
    required this.scoreL2,
    required this.scoreL3,
    required this.scoreL4,
    required this.scoreAlgae,
    required this.netScore,
  });
}