import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';

abstract interface class SavingInteractor {
  Future<bool> saveAlgorithmAndDuration(
    AlgorithmType algorithmType,
    Duration timeExecuting,
  );
}
