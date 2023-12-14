import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';

abstract interface class SettingsInteractor {
  Future<void> saveAlgorithmType(AlgorithmType algorithmType);
  Future<void> saveValueType(ValueType valueType);
  Future<void> saveLength(int length);
  Future<void> saveDelay(Duration delay);

  Future<AlgorithmType> getAlgorithmType();
  Future<ValueType> getValueType();
  Future<int> getLength();
  Future<Duration> getDelay();

  Future<bool> getShouldPersist();
  Future<void> updateShouldPersist(bool shouldPersist);
}
