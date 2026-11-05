import 'package:flutter_riverpod/flutter_riverpod.dart';


class Robots {
  final L1;
  final L2;
  final L3;
  final L4;
  final algae;
  final net;

  Robots({
    required this.L1,
    required this.L2,
    required this.L3,
    required this.L4,
    required this.algae,
    required this.net,
  });
}

class RobotListNotifier extends Notifier<List<Robots>> {
  @override
  List<Robots> build() {
    return [];
  }

final RobotListProvidor = NotifierProvider<RobotListNotifier, List>(RobotListNotifier.new);}

final RobotListProvidor = NotifierProvider<RobotListNotifier, List<Item>>(() => ItemListNotifier(),);

class