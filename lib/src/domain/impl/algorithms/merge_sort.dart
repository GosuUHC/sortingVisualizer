import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class MergeSort implements SortingAlgorithm {
  final Swapper swapper;
  final ValuesComparator comparator;
  bool isComplete = false;

  MergeSort(this.swapper, this.comparator);

  @override
  Future<void> sort(List input) async {
    await mergeSort(input, 0, input.length - 1);
  }

  int nextGap(int gap) {
    return gap > 1 ? (gap / 2).ceil() : 0;
  }

  Future<void> merge(List input, int start, int end) async {
    if (isComplete) {
      return;
    }

    int gap = end - start + 1;
    gap = nextGap(gap);

    while (gap > 0) {
      int i = start;
      while (i + gap <= end) {
        int j = i + gap;

        if (await comparator.compare(input, i, j) > 0) {
          await swapper.swap(input, i, j);
        }

        i++;
      }
      gap = nextGap(gap);
    }
  }

  Future<void> mergeSort(List input, int left, int right) async {
    if (isComplete || left >= right) {
      return;
    }

    int mid = left + ((right - left) ~/ 2);
    await mergeSort(input, left, mid);
    await mergeSort(input, mid + 1, right);
    await merge(input, left, right);
  }

  @override
  Future<void> stopSorting() async {
    isComplete = true;
  }
}
