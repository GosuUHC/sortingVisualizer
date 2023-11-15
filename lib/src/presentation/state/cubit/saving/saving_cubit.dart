import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/saving_interactor.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/saving/saving_state.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/saving/saving_status.dart';

class SavingCubit extends Cubit<SavingState> {
  final SavingInteractor savingInteractor;

  SavingCubit({
    required this.savingInteractor,
  }) : super(SavingState.initial());

  Future<void> saveData(
    AlgorithmType algorithmType,
    Duration timeExecuting,
  ) async {
    emit(state.copyWith(savingStatus: SavingStatus.loading));

    final isSucceeded = await savingInteractor.saveAlgorithmAndDuration(
        algorithmType, timeExecuting);

    _updateStatus(isSucceeded);
  }

  void _updateStatus(bool result) {
    switch (result) {
      case true:
        emit(state.copyWith(savingStatus: SavingStatus.success));
      default:
        emit(state.copyWith(savingStatus: SavingStatus.failure));
    }
  }
}
