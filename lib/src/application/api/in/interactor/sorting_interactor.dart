import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';

abstract interface class SortingInteractor {
  Future<void> startSorting(
    AlgorithmType algorithmType,
    List input,
    Duration? delay,
    Function? onChangeCallback,
    Function? onCompareCallback,
  );
  Future<void> pauseSorting();
  Future<void> resumeSorting();
  void reset();
  void updateDelay(Duration delay);
}
