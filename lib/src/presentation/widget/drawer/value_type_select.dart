import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/application/value_type.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_cubit.dart';

class ValueTypeSelect extends StatelessWidget {
  const ValueTypeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final valueType = context.select(
      (SortingCubit cubit) => cubit.state.valueType,
    );

    print("value type select rebuild");

    return ListTile(
      title: const Text("Value Generation Type"),
      subtitle: const Text("Choose how values are generated"),
      leading: const Icon(Icons.data_usage),
      trailing: DropdownMenu<ValueType>(
        initialSelection: valueType,
        onSelected: (ValueType? valueType) {
          context
              .read<SortingCubit>()
              .updateSelectedValueType(valueType ?? ValueType.random);
        },
        dropdownMenuEntries: ValueType.values.map((ValueType valueType) {
          return DropdownMenuEntry<ValueType>(
            value: valueType,
            label: valueType.name,
          );
        }).toList(),
      ),
    );
  }
}
