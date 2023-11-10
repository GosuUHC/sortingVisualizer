import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_cubit.dart';

class DelayDurationSlider extends StatelessWidget {
  const DelayDurationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final delay = context.select((SortingCubit cubit) => cubit.state.delay);

    print("delay duration slider rebuild");

    return ListTile(
      title: const Text("Delay"),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: delay.inMilliseconds.toDouble(),
          min: 5,
          max: 300,
          onChanged: (value) {
            context
                .read<SortingCubit>()
                .updateSelectedDelay(Duration(milliseconds: value.toInt()));
          },
        ),
      ),
    );
  }
}
