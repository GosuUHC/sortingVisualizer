import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/settings_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/out/settings_repository.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';

class SettingsInteractorImpl implements SettingsInteractor {
  SettingsRepository repository;

  SettingsInteractorImpl({required this.repository});

  @override
  Future<AlgorithmType> getAlgorithmType() async {
    return await repository.getAlgorithmType();
  }

  @override
  Future<ValueType> getValueType() async {
    return await repository.getValueType();
  }

  @override
  Future<Duration> getDelay() async {
    return await repository.getDelay();
  }

  @override
  Future<int> getLength() async {
    return await repository.getLength();
  }

  @override
  Future<void> saveAlgorithmType(AlgorithmType algorithmType) async {
    await repository.saveAlgorithmType(algorithmType);
  }

  @override
  Future<void> saveValueType(ValueType valueType) async {
    await repository.saveValueType(valueType);
  }

  @override
  Future<void> saveLength(int length) async {
    await repository.saveLength(length);
  }

  @override
  Future<void> saveDelay(Duration delay) async {
    await repository.saveDelay(delay);
  }

  @override
  Future<bool> getShouldPersist() async {
    return await repository.getShouldPersist();
  }

  @override
  Future<void> updateShouldPersist(bool shouldPersist) async {
    await repository.updateShouldPersist(shouldPersist);
  }
}
