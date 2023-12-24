import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/sorting_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/impl/comparator/async_callback_comparator.dart';
import 'package:sorting_algorithms_visualization/src/application/impl/swapper/async_callback_swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/factory/sorting_algorithms_factory.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/in/sorting_algorithm.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/swapper.dart';
import 'package:sorting_algorithms_visualization/src/domain/api/out/values_comparator.dart';

class SortingInteractorImpl implements SortingInteractor {
  SortingAlgorithm? sortingAlgorithm;
  late Swapper swapper;
  late ValuesComparator comparator;
  late Duration delay;
  bool isSorting = false;

  @override
  Future<void> startSorting(
    AlgorithmType algorithmType,
    List input,
    Duration delay,
    Function onChangeCallback,
    Function onCompareCallback,
  ) async {
    this.delay = delay;
    swapper = _configureSwapper(onChangeCallback);
    comparator = _configureComparator(
      onCompareCallbackWrapper(onCompareCallback),
    );

    sortingAlgorithm = _configureSortingAlgorithm(algorithmType);
    isSorting = true;

    await sortingAlgorithm?.sort(input);
  }

  @override
  void updateDelay(Duration delay) {
    this.delay = delay;
  }

  Future<void> flagListener() async {
    while (!isSorting) {
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  Function onCompareCallbackWrapper(Function onCompareCallback) {
    return (List<int> indicies) async {
      await Future.delayed(delay);
      await flagListener();

      onCompareCallback(indicies);
    };
  }

  @override
  Future<void> pauseSorting() async {
    isSorting = false;
  }

  @override
  Future<void> resumeSorting() async {
    isSorting = true;
  }

  @override
  void reset() async {
    await sortingAlgorithm?.stopSorting();
  }

  Swapper _configureSwapper(Function? onChangeCallback) {
    return AsyncCallbackSwapper(onChangeCallback ?? () {});
  }

  ValuesComparator _configureComparator(Function? onCompareCallback) {
    return AsyncCallbackComparator(onCompareCallback ?? () {});
  }

  SortingAlgorithm _configureSortingAlgorithm(AlgorithmType algorithm) {
    return switch (algorithm) {
      AlgorithmType.bubble =>
        SortingAlgorithmsFactory.createBubbleSort(swapper, comparator),
      AlgorithmType.selection =>
        SortingAlgorithmsFactory.createSelectionSort(swapper, comparator),
      AlgorithmType.quick =>
        SortingAlgorithmsFactory.createQuickSort(swapper, comparator),
      AlgorithmType.merge =>
        SortingAlgorithmsFactory.createMergeSort(swapper, comparator),
      AlgorithmType.insertion =>
        SortingAlgorithmsFactory.createInsertionSort(swapper, comparator),
    };
  }
}
