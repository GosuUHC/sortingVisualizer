import 'package:flutter/material.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/drawer/delay_duration_slider.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/drawer/sorting_algorithm_select.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/drawer/value_count_slider.dart';
import 'package:sorting_algorithms_visualization/src/presentation/widget/drawer/value_type_select.dart';

class RightEndDrawer extends Drawer {
  const RightEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    print("right end drawer rebuild");

    return SizedBox(
      width: 400,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 25, 104, 169)),
            child: Text(
              "Sorting Options",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          SortingAlgorithmSelect(),
          ValueTypeSelect(),
          ValueCountSlider(),
          DelayDurationSlider(),
        ],
      ),
    );
  }
}
