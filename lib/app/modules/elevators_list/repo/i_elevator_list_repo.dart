

import '../entity/elevator.dart';

abstract class IElevatorListRepo {
  Future<String> updateElevatorStatus(String id);

  Future<List<Elevator>> getNotonlineElevators();
}