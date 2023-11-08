import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generators/few_unique_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generators/nearly_sorted_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generators/odd_even_split_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generators/random_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generators/reversed_values_generator.dart';

class ValuesGeneratorsFactory {
  static ValuesGenerator createFewUniqueValuesGenerator() =>
      FewUniqueValuesGenerator();
  static ValuesGenerator createNearlySortedGenerator() =>
      NearlySortedValuesGenerator();
  static ValuesGenerator createOddEvenSplitGenerator() =>
      OddEvenSplitValuesGenerator();
  static ValuesGenerator createRandomGenerator() => RandomValuesGenerator();
  static ValuesGenerator createReversedGenerator() => ReversedValuesGenerator();
}
