import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class BubbleSort implements SortingAlgorithm {
  final Swapper swapper;
  final ValuesComparator comparator;
  bool isComplete = false;

  BubbleSort(this.swapper, this.comparator);

  @override
  Future<void> sort(List input) async {
    final length = input.length;
    for (int i = 0; i < length - 1; i++) {
      bool swapped = false;

      for (int j = 0; j < length - 1 - i; j++) {
        if (isComplete) {
          return;
        }
        if (await comparator.compare(input, j, j + 1) > 0) {
          await swapper.swap(input, j, j + 1);
          swapped = true;
        }
      }

      if (!swapped) {
        break; // if no swaps were made, the list is already sorted
      }
    }
  }

  @override
  Future<void> stopSorting() async {
    isComplete = true;
  }
}
