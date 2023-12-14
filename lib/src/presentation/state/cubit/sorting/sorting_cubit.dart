import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/settings_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/sorting_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/values_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_state.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_status.dart';

class SortingCubit extends Cubit<SortingState> {
  final SortingInteractor sortingInteractor;
  final ValuesInteractor valuesInteractor;
  final SettingsInteractor settingsInteractor;

  SortingCubit({
    required this.sortingInteractor,
    required this.valuesInteractor,
    required this.settingsInteractor,
  }) : super(SortingState.initial()) {
    initialize();
  }

  Future<void> initialize() async {
    emit(state.copyWith(
      shouldSaveSettings: await settingsInteractor.getShouldPersist(),
    ));

    if (state.shouldSaveSettings) {
      emit(state.copyWith(
        algorithmType: await settingsInteractor.getAlgorithmType(),
        valueType: await settingsInteractor.getValueType(),
        length: await settingsInteractor.getLength(),
        delay: await settingsInteractor.getDelay(),
      ));
    }

    generateInitialValues();
  }

  void generateInitialValues() {
    final values = List<int>.from(
      valuesInteractor.getValues(state.valueType, state.length),
    );

    emit(state.copyWith(initialData: values, sortedData: values.toList()));
  }

  void updateSelectedAlgorithm(AlgorithmType algorithmType) {
    emit(state.copyWith(
      algorithmType: algorithmType,
      sortingStatus: SortingStatus.initial,
    ));

    settingsInteractor.saveAlgorithmType(algorithmType);

    sortingInteractor.reset();
  }

  void updateSelectedDelay(Duration delay) {
    emit(state.copyWith(delay: delay));

    settingsInteractor.saveDelay(delay);
    sortingInteractor.updateDelay(state.delay);
  }

  void updateSelectedValueType(ValueType valueType) {
    emit(state.copyWith(valueType: valueType));

    settingsInteractor.saveValueType(valueType);
    generateInitialValues();
    reset();
  }

  void updateSelectedLength(int length) {
    emit(state.copyWith(length: length));

    settingsInteractor.saveLength(length);
    generateInitialValues();
    reset();
  }

  void updateShouldSaveSettings(bool shouldSaveSettings) {
    emit(state.copyWith(shouldSaveSettings: shouldSaveSettings));

    settingsInteractor.updateShouldPersist(shouldSaveSettings);
  }

  void _onSwapElements() {
    emit(state.copyWith(sortedData: state.sortedData));
  }

  void _onCompareElements(List<int> comparingIndices) {
    emit(state.copyWith(comparingIndices: comparingIndices));
  }

  Future<void> reset() async {
    sortingInteractor.reset();

    emit(state.copyWith(
      sortedData: state.initialData.toList(),
      comparingIndices: [],
      sortingStatus: SortingStatus.initial,
    ));
  }

  void onPressPlayButton() {
    if (state.sortingStatus == SortingStatus.running) {
      pauseSorting();
    } else if (state.sortingStatus == SortingStatus.paused) {
      resumeSorting();
    } else if (state.sortingStatus == SortingStatus.initial) {
      startSorting();
    }
  }

  Future<void> startSorting() async {
    emit(state.copyWith(
      sortedData: state.sortedData,
      comparingIndices: [],
      sortingStatus: SortingStatus.running,
      onSwapElements: _onSwapElements,
      onCompareElements: _onCompareElements,
    ));

    await sortingInteractor.startSorting(
      state.algorithmType,
      state.sortedData,
      state.delay,
      state.onSwapElements,
      state.onCompareElements,
    );
  }

  Future<void> pauseSorting() async {
    emit(state.copyWith(sortingStatus: SortingStatus.paused));
    await sortingInteractor.pauseSorting();
  }

  Future<void> resumeSorting() async {
    emit(state.copyWith(sortingStatus: SortingStatus.running));
    await sortingInteractor.resumeSorting();
  }
}
