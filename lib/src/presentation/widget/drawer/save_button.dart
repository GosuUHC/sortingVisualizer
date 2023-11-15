import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/saving/saving_cubit.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/saving/saving_status.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  Widget _getIconWidget(SavingStatus status) {
    return switch (status) {
      SavingStatus.loading => const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      SavingStatus.success => const Icon(Icons.check, color: Colors.green),
      SavingStatus.failure => const Icon(Icons.close, color: Colors.red),
      _ => const Icon(Icons.save, color: Colors.deepPurple)
    };
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (SavingCubit cubit) => cubit.state.savingStatus,
    );

    return IconButton(
      onPressed: () {
        final algorithmType = context.read<SortingCubit>().state.algorithmType;

        print("SAVING ALGORITHM: $algorithmType");

        const timeExecuting = Duration(milliseconds: 1000);
        context.read<SavingCubit>().saveData(algorithmType, timeExecuting);
      },
      icon: _getIconWidget(status),
    );
  }
}
