import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class QuickSort implements SortingAlgorithm {
  final Swapper swapper;
  final ValuesComparator comparator;
  bool isComplete = false;

  QuickSort(this.swapper, this.comparator);

  @override
  Future<void> sort(List input) async {
    await quickSort(input, 0, input.length - 1);
  }

  Future<void> quickSort(List input, int low, int high) async {
    if (low >= high || isComplete) {
      return;
    }

    int pivotIndex = await partition(input, low, high);

    await quickSort(input, low, pivotIndex - 1);
    await quickSort(input, pivotIndex + 1, high);
  }

  Future<int> _medianOfThree(List input, int low, int middle, int high) async {
    int a = await comparator.compare(input, low, middle);
    int b = await comparator.compare(input, middle, high);
    int c = await comparator.compare(input, low, high);

    if (a <= 0 && b <= 0) return middle;
    if (a <= 0 && c <= 0) return high;
    return low;
  }

  Future<int> partition(List input, int low, int high) async {
    int middle = (low + high) ~/ 2;
    int pivotIndex = await _medianOfThree(input, low, middle, high);
    await swapper.swap(input, pivotIndex, middle);

    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (await comparator.compare(input, j, high) <= 0) {
        i++;
        await swapper.swap(input, i, j);
      }
    }

    await swapper.swap(input, i + 1, high);
    return i + 1;
  }

  @override
  Future<void> stopSorting() async {
    isComplete = true;
  }
}
