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

    print("start stop button rebuild");

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            // start/pause/resume sorting
            context.read<SortingCubit>().onPressPlayButton();
          },
          child: Icon(
            sortingStatus == SortingStatus.running
                ? Icons.pause
                : Icons.play_arrow_outlined,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            // Reset list values to initial
            context.read<SortingCubit>().reset();
          },
          child: const Icon(Icons.restart_alt_rounded),
        ),
      ],
    );
  }
}
