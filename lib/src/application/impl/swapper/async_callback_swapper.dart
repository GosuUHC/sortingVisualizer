import 'dart:async';

import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';

class AsyncCallbackSwapper implements Swapper {
  Function onChangeCallback;

  AsyncCallbackSwapper(this.onChangeCallback);

  // swaps elements with indicies i and j inside of list
  @override
  Future<void> swap(List input, int i, int j) async {
    await onChangeCallback();

    final temp = input[i];
    input[i] = input[j];
    input[j] = temp;
  }
}
