import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  Widget _getIconWidget(bool shouldSaveSettings) {
    return switch (shouldSaveSettings) {
      false => const Icon(Icons.save, color: Colors.blue),
      true => const Icon(Icons.check, color: Colors.green)
    };
  }

  @override
  Widget build(BuildContext context) {
    final shouldSaveSettings = context.select(
      (SortingCubit cubit) => cubit.state.shouldSaveSettings,
    );

    return ListTile(
      title: const Text("Save settings"),
      trailing: IconButton(
        onPressed: () {
          context
              .read<SortingCubit>()
              .updateShouldSaveSettings(!shouldSaveSettings);
        },
        icon: _getIconWidget(shouldSaveSettings),
      ),
    );
  }
}
