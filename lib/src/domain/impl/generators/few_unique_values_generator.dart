import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

// [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
class FewUniqueValuesGenerator implements ValuesGenerator {
  @override
  List generate(int length) {
    List data = List.generate(length, (index) => index % 2);
    return data;
  }
}
