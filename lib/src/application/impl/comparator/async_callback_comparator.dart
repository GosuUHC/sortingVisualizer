import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class AsyncCallbackComparator implements ValuesComparator {
  Function onCompareCallback;

  AsyncCallbackComparator(this.onCompareCallback);

  // compares elements with indicies i and j inside of a list
  @override
  Future<int> compare(List input, int i, int j) async {
    await onCompareCallback([i, j]);

    return input[i].compareTo(input[j]);
  }
}
