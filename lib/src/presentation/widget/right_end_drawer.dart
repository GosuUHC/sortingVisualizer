import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/algorithm_type.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_cubit.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_state.dart';

class RightEndDrawer extends Drawer {
  const RightEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingCubit, SortingState>(
      builder: (context, state) {
        return SizedBox(
          width: 400,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "Sorting Options",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              ListTile(
                title: const Text("Sorting algorithm"),
                subtitle: const Text("Choose algorithm"),
                leading: const Icon(Icons.sort),
                trailing: DropdownButton<AlgorithmType>(
                  value: state.algorithmType,
                  items:
                      AlgorithmType.values.map((AlgorithmType algorithmType) {
                    return DropdownMenuItem<AlgorithmType>(
                      value: algorithmType,
                      child: Text(algorithmType.name),
                    );
                  }).toList(),
                  onChanged: (AlgorithmType? algorithmType) {
                    context.read<SortingCubit>().updateSelectedAlgorithm(
                        algorithmType ?? AlgorithmType.bubble);
                  },
                ),
              ),
              ListTile(
                title: const Text("Value Generation Type"),
                subtitle: const Text("Choose how values are generated"),
                leading: const Icon(Icons.data_usage),
                trailing: DropdownButton<ValueType>(
                  value: state.valueType,
                  items: ValueType.values.map((ValueType valueType) {
                    return DropdownMenuItem<ValueType>(
                      value: valueType,
                      child: Text(valueType.name),
                    );
                  }).toList(),
                  onChanged: (ValueType? valueType) {
                    context
                        .read<SortingCubit>()
                        .updateSelectedValueType(valueType ?? ValueType.random);
                  },
                ),
              ),
              ListTile(
                title: const Text("Value Count"),
                trailing: SizedBox(
                  width: 200, // Set a suitable width based on your design.
                  child: Slider(
                    value: state.length.toDouble(),
                    min: 1,
                    max: 100,
                    onChanged: (value) {
                      context
                          .read<SortingCubit>()
                          .updateSelectedLength(value.toInt());
                    },
                  ),
                ),
              ),
              ListTile(
                title: const Text("Sorting Speed"),
                trailing: SizedBox(
                  width: 200, // Set a suitable width based on your design.
                  child: Slider(
                    value: 5,
                    min: 1,
                    max: 10,
                    onChanged: (value) {
                      // Implement your logic when the sorting speed is changed.
                      // Update the 'sortingSpeed' state here.
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
