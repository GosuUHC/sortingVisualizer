import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

import 'package:sorting_algorithms_visualization/src/domain/impl/algorithm/bubble_sort.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/algorithm/insertion_sort.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/algorithm/merge_sort.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/algorithm/quick_sort.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/algorithm/selection_sort.dart';

class SortingAlgorithmsFactory {
  static SortingAlgorithm createBubbleSort(
          Swapper swapper, ValuesComparator comparator) =>
      BubbleSort(swapper, comparator);
  static SortingAlgorithm createSelectionSort(
          Swapper swapper, ValuesComparator comparator) =>
      SelectionSort(swapper, comparator);
  static SortingAlgorithm createQuickSort(
          Swapper swapper, ValuesComparator comparator) =>
      QuickSort(swapper, comparator);
  static SortingAlgorithm createMergeSort(
          Swapper swapper, ValuesComparator comparator) =>
      MergeSort(swapper, comparator);
  static SortingAlgorithm createInsertionSort(
          Swapper swapper, ValuesComparator comparator) =>
      InsertionSort(comparator, swapper);
}
