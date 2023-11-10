import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_cubit.dart';

class SortingAlgorithmSelect extends StatelessWidget {
  const SortingAlgorithmSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final algorithmType = context.select(
      (SortingCubit cubit) => cubit.state.algorithmType,
    );

    print("sorting algorithm select rebuild");

    return ListTile(
      title: const Text("Sorting algorithm"),
      subtitle: const Text("Choose algorithm"),
      leading: const Icon(Icons.sort),
      trailing: DropdownMenu<AlgorithmType>(
        initialSelection: algorithmType,
        onSelected: (AlgorithmType? algorithmType) {
          context
              .read<SortingCubit>()
              .updateSelectedAlgorithm(algorithmType ?? AlgorithmType.bubble);
        },
        dropdownMenuEntries:
            AlgorithmType.values.map((AlgorithmType algorithmType) {
          return DropdownMenuEntry<AlgorithmType>(
            value: algorithmType,
            label: algorithmType.name,
          );
        }).toList(),
      ),
    );
  }
}
