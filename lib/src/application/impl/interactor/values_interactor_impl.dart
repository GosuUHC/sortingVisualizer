import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/values_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/factory/values_generators_factory.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/in/values_generator.dart';

class ValuesInteractorImpl implements ValuesInteractor {
  late ValuesGenerator generator;

  @override
  List getValues(ValueType type, int length) {
    generator = _configureGenerator(type);
    return generator.generate(length);
  }

  ValuesGenerator _configureGenerator(ValueType type) {
    return switch (type) {
      ValueType.fewUnique =>
        ValuesGeneratorsFactory.createFewUniqueValuesGenerator(),
      ValueType.nearlySorted =>
        ValuesGeneratorsFactory.createNearlySortedGenerator(),
      ValueType.oddEvenSplit =>
        ValuesGeneratorsFactory.createOddEvenSplitGenerator(),
      ValueType.random => ValuesGeneratorsFactory.createRandomGenerator(),
      ValueType.reversed => ValuesGeneratorsFactory.createReversedGenerator(),
    };
  }
}
