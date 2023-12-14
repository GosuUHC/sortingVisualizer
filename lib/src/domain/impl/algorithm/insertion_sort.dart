import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class InsertionSort implements SortingAlgorithm {
  final Swapper swapper;
  final ValuesComparator comparator;
  bool isCompleted = false;

  InsertionSort(this.swapper, this.comparator);

  @override
  Future<void> sort(List input) async {
    for (int i = 1; i < input.length; i++) {
      int j = i;

      while (j > 0) {
        if (isCompleted) {
          return;
        }

        if (await comparator.compare(input, j, j - 1) < 0) {
          await swapper.swap(input, j, j - 1);
          j--;
        } else {
          break;
        }
      }
    }
  }

  @override
  Future<void> stopSorting() async {
    isCompleted = true;
  }
}
