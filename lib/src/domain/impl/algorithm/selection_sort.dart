import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class SelectionSort implements SortingAlgorithm {
  final Swapper swapper;
  final ValuesComparator comparator;
  bool isComplete = false;

  SelectionSort(this.swapper, this.comparator);

  @override
  Future<void> sort(List input) async {
    final length = input.length;

    for (int i = 0; i < length - 1; i++) {
      int minIndex = i;

      for (int j = i + 1; j < length; j++) {
        if (isComplete) {
          return;
        }
        if (await comparator.compare(input, j, minIndex) < 0) {
          minIndex = j;
        }
      }

      if (i != minIndex) {
        await swapper.swap(input, i, minIndex);
      }
    }
  }

  @override
  Future<void> stopSorting() async {
    isComplete = true;
  }
}
