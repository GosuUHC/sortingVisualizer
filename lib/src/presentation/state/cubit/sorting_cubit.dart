import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/sorting_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/values_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_state.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_status.dart';

class SortingCubit extends Cubit<SortingState> {
  final SortingInteractor sortingInteractor;
  final ValuesInteractor valuesInteractor;

  SortingCubit(
      {required this.sortingInteractor, required this.valuesInteractor})
      : super(SortingState.initial());

  void generateInitialValues() {
    final values = List<int>.from(
        valuesInteractor.getValues(state.valueType, state.length));

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
    } else if (state.sortingStatus == SortingStatus.initialNoValues) {
      generateInitialValues();
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
