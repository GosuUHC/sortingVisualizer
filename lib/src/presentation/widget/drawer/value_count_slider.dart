import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_cubit.dart';

class ValueCountSlider extends StatelessWidget {
  const ValueCountSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final length = context.select((SortingCubit cubit) => cubit.state.length);

    print("value count slider rebuild");

    return ListTile(
      title: const Text("Value Count"),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: length.toDouble(),
          min: 1,
          max: 100,
          onChanged: (value) {
            context.read<SortingCubit>().updateSelectedLength(value.toInt());
          },
        ),
      ),
    );
  }
}
