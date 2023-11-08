import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

// [0, 9, 2, 7, 4, 5, 6, 3, 8, 1]
class OddEvenSplitValuesGenerator implements ValuesGenerator {
  @override
  List generate(int length) {
    List data = List.generate(
        length, (index) => index % 2 == 0 ? index : length - index);
    return data;
  }
}
