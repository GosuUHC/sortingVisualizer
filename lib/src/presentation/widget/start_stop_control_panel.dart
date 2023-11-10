import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_cubit.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting_status.dart';

class StartStopControlPanel extends StatelessWidget {
  const StartStopControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final sortingStatus = context.select(
      (SortingCubit cubit) => cubit.state.sortingStatus,
    );

    // same as ^
    // final sortingStatus = context.select<SortingCubit, SortingStatus>(
    //   (cubit) => cubit.state.sortingStatus,
    // );

    print("start stop button rebuild");

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(
            sortingStatus == SortingStatus.running
                ? Icons.pause
                : Icons.play_arrow_outlined,
          ),
          onPressed: () {
            // start/pause/resume sorting
            context.read<SortingCubit>().onPressPlayButton();
          },
        ),
        const SizedBox(width: 1.5),
        FloatingActionButton(
          child: const Icon(Icons.restart_alt_rounded),
          onPressed: () {
            // Reset list values to initial
            context.read<SortingCubit>().reset();
          },
        ),
      ],
    );
  }
}
