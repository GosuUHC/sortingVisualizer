import 'package:shared_preferences/shared_preferences.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/out/settings_repository.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/constants.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const String algorithmTypeIndexKey = 'algorithmTypeIndex';
  static const String valueTypeIndexKey = 'valueType';
  static const String lengthKey = 'length';
  static const String delayKey = 'delay';
  static const String shouldPersistKey = 'shouldPersist';

  final SharedPreferences prefs;

  SettingsRepositoryImpl({
    required this.prefs,
  });

  @override
  Future<AlgorithmType> getAlgorithmType() async {
    return AlgorithmType.values[prefs.getInt(algorithmTypeIndexKey) ??
        DefaultConstants.defaultAlgoritmType.index];
  }

  @override
  Future<void> saveAlgorithmType(AlgorithmType algorithmType) async {
    await prefs.setInt(algorithmTypeIndexKey, algorithmType.index);
  }

  @override
  Future<ValueType> getValueType() async {
    return ValueType.values[prefs.getInt(valueTypeIndexKey) ??
        DefaultConstants.defaultValueType.index];
  }

  @override
  Future<void> saveValueType(ValueType valueType) async {
    await prefs.setInt(valueTypeIndexKey, valueType.index);
  }

  @override
  Future<int> getLength() async {
    return prefs.getInt(lengthKey) ?? DefaultConstants.defaultLength;
  }

  @override
  Future<void> saveLength(int length) async {
    await prefs.setInt(lengthKey, length);
  }

  @override
  Future<Duration> getDelay() async {
    final int delayInMillis =
        prefs.getInt(delayKey) ?? DefaultConstants.defaultDelay.inMilliseconds;
    return Duration(milliseconds: delayInMillis);
  }

  @override
  Future<void> saveDelay(Duration delay) async {
    await prefs.setInt(delayKey, delay.inMilliseconds);
  }

  @override
  Future<bool> getShouldPersist() async {
    return prefs.getBool(shouldPersistKey) ??
        DefaultConstants.defaultShouldSaveSettings;
  }

  @override
  Future<void> updateShouldPersist(bool shouldPersist) async {
    await prefs.setBool(shouldPersistKey, shouldPersist);

    if (!shouldPersist) {
      await clearStorage();
    }
  }

  Future<void> clearStorage() async {
    await prefs.remove(algorithmTypeIndexKey);
    await prefs.remove(valueTypeIndexKey);
    await prefs.remove(lengthKey);
    await prefs.remove(delayKey);
    await prefs.remove(shouldPersistKey);
  }
}
