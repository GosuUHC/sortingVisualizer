import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generator/few_unique_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generator/nearly_sorted_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generator/odd_even_split_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generator/random_values_generator.dart';
import 'package:sorting_algorithms_visualization/src/domain/impl/generator/reversed_values_generator.dart';

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
