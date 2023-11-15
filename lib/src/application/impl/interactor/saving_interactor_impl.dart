import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/in/interactor/saving_interactor.dart';
import 'package:sorting_algorithms_visualization/src/application/api/out/saving_repository.dart';

class SavingInteractorImpl implements SavingInteractor {
  SavingRepository repository;

  SavingInteractorImpl(this.repository);

  @override
  Future<bool> saveAlgorithmAndDuration(
    AlgorithmType algorithmType,
    Duration timeExecuting,
  ) async {
    return await repository.saveAlgorithmAndDuration(
        algorithmType, timeExecuting);
  }
}
