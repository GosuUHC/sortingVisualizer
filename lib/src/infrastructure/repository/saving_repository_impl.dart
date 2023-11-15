import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/api/out/saving_repository.dart';

class SavingRepositoryImpl implements SavingRepository {
  @override
  Future<bool> saveAlgorithmAndDuration(
    AlgorithmType algorithmType,
    Duration timeExecuting,
  ) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    return true;
  }
}
