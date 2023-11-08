import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/constants.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_status.dart';

class SortingState {
  final List<int> initialData;
  final List<int> sortedData;
  final List<int> comparingIndices;
  final SortingStatus sortingStatus;
  final AlgorithmType algorithmType;
  final ValueType valueType;
  final int length;
  final Duration delay;
  final Function onSwapElements;
  final Function onCompareElements;

  SortingState._({
    required this.initialData,
    required this.sortedData,
    required this.comparingIndices,
    required this.sortingStatus,
    required this.algorithmType,
    required this.valueType,
    required this.length,
    required this.delay,
    required this.onSwapElements,
    required this.onCompareElements,
  });

  SortingState.initial()
      : this._(
          initialData: [],
          sortedData: [],
          comparingIndices: [],
          sortingStatus: DefaultConstants.defaultSortingStatus,
          algorithmType: DefaultConstants.defaultAlgoritmType,
          valueType: DefaultConstants.defaultValueType,
          length: DefaultConstants.defaultLength,
          delay: DefaultConstants.defaultDelay,
          onSwapElements: () {},
          onCompareElements: () {},
        );

  SortingState copyWith({
    List<int>? initialData,
    List<int>? sortedData,
    List<int>? comparingIndices,
    SortingStatus? sortingStatus,
    AlgorithmType? algorithmType,
    ValueType? valueType,
    int? length,
    Duration? delay,
    Function? onSwapElements,
    Function? onCompareElements,
  }) {
    return SortingState._(
      initialData: initialData ?? this.initialData,
      sortedData: sortedData ?? this.sortedData,
      comparingIndices: comparingIndices ?? this.comparingIndices,
      sortingStatus: sortingStatus ?? this.sortingStatus,
      algorithmType: algorithmType ?? this.algorithmType,
      valueType: valueType ?? this.valueType,
      length: length ?? this.length,
      delay: delay ?? this.delay,
      onSwapElements: onSwapElements ?? this.onSwapElements,
      onCompareElements: onCompareElements ?? this.onCompareElements,
    );
  }
}
