import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

// [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
class ReversedValuesGenerator implements ValuesGenerator {
  @override
  List generate(int length) {
    List data = List.generate(length, (index) => length - index);
    return data;
  }
}
