import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_status.dart';

final class DefaultConstants {
  static const AlgorithmType defaultAlgoritmType = AlgorithmType.bubble;
  static const SortingStatus defaultSortingStatus =
      SortingStatus.initialNoValues;
  static const int defaultLength = 50;
  static const ValueType defaultValueType = ValueType.random;
  static const Duration defaultDelay = Duration(milliseconds: 50);
}
