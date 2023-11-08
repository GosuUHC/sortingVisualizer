import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class InsertionSort implements SortingAlgorithm {
  Swapper? swapper;
  ValuesComparator? comparator;
  bool isCompleted = false;

  InsertionSort(this.comparator, this.swapper);

  @override
  Future<void> sort(List input) async {
    for (int i = 1; i < input.length; i++) {
      if (isCompleted) {
        return;
      }
      int j = input[i];
      for (j = i - 1;
          j >= 0 && await comparator!.compare(input, i, j) < 0;
          j--) {
        input[j + 1] = input[j];
      }
      if (j < i - 1) {
        await swapper!.swap(input, j + 1, i);
      }
    }
  }

  @override
  Future<void> stopSorting() async {
    isCompleted = true;
  }
}
