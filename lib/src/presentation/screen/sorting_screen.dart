import 'package:flutter/material.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/columns_card.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/right_end_drawer.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/start_stop_control_panel.dart';

class SortingScreen extends StatelessWidget {
  const SortingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorting Visualization"),
      ),
      body: const ColumnsCard(),
      floatingActionButton: const StartStopControlPanel(),
      endDrawer: const RightEndDrawer(),
    );
  }
}
