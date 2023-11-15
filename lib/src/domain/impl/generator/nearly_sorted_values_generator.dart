import 'dart:math';

import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

// [0, 3, 6, 3, 8, 7, 7, 9, 9, 12]
class NearlySortedValuesGenerator implements ValuesGenerator {
  @override
  List generate(int length) {
    final random = Random();

    return List.generate(length, (index) => index + random.nextInt(5));
  }
}
