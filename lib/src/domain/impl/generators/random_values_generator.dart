import 'dart:math';

import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

// [8, 8, 7, 9, 0, 3, 1, 8, 2, 3]
class RandomValuesGenerator implements ValuesGenerator {
  @override
  List generate(int length) {
    final random = Random();
    return List.generate(length, (index) => random.nextInt(length));
  }
}
