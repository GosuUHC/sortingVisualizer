import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/sorting_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/values_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/constants.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_state.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_status.dart';

class SortingCubit extends HydratedCubit<SortingState> {
  final SortingInteractor sortingInteractor;
  final ValuesInteractor valuesInteractor;

  SortingCubit({
    required this.sortingInteractor,
    required this.valuesInteractor,
  }) : super(SortingState.initial()) {
    initialize();
  }

  Future<void> initialize() async {
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

    sortingInteractor.reset();
  }

  void updateSelectedDelay(Duration delay) {
    emit(state.copyWith(delay: delay));

    sortingInteractor.updateDelay(state.delay);
  }

  void updateSelectedValueType(ValueType valueType) {
    emit(state.copyWith(valueType: valueType));

    generateInitialValues();
    reset();
  }

  void updateSelectedLength(int length) {
    emit(state.copyWith(length: length));

    generateInitialValues();
    reset();
  }

  void updateShouldSaveSettings(bool shouldSaveSettings) {
    emit(state.copyWith(shouldSaveSettings: shouldSaveSettings));
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

  @override
  SortingState? fromJson(Map<String, dynamic> json) {
    return SortingState.initial().copyWith(
      algorithmType: AlgorithmType.values[
          json["algorithmType"] ?? DefaultConstants.defaultAlgoritmType.index],
      valueType: ValueType
          .values[json["valueType"] ?? DefaultConstants.defaultValueType.index],
      length: json["length"] ?? DefaultConstants.defaultLength,
      delay: Duration(
          milliseconds:
              json["delay"] ?? DefaultConstants.defaultDelay.inMilliseconds),
      shouldSaveSettings: json["shouldSaveSettings"] ??
          DefaultConstants.defaultShouldSaveSettings,
    );
  }

  @override
  Map<String, dynamic>? toJson(SortingState state) {
    if (state.shouldSaveSettings) {
      return {
        "algorithmType": state.algorithmType.index,
        "valueType": state.valueType.index,
        "length": state.length,
        "delay": state.delay.inMilliseconds,
        "shouldSaveSettings": true,
      };
    } else {
      return {};
    }
  }
}
