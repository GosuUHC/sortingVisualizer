import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/saving/saving_status.dart';

class SavingState {
  final SavingStatus savingStatus;

  SavingState({required this.savingStatus});

  factory SavingState.initial() {
    return SavingState(savingStatus: SavingStatus.initial);
  }

  SavingState copyWith({SavingStatus? savingStatus}) {
    return SavingState(savingStatus: savingStatus ?? this.savingStatus);
  }
}
