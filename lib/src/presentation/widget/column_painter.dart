import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sorting_algorithms_visualization/src/presentation/state/cubit/sorting/sorting_cubit.dart';

class ColumnPainter extends StatelessWidget {
  const ColumnPainter({super.key});

  @override
  Widget build(BuildContext context) {
    final sortedData = context.select(
      (SortingCubit cubit) => cubit.state.sortedData,
    );

    final comparingIndices = context.select(
      (SortingCubit cubit) => cubit.state.comparingIndices,
    );

    print("column painter rebuild");

    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 1.8),
      painter: ColumnGraphPainter(sortedData, comparingIndices),
    );
  }
}

class ColumnGraphPainter extends CustomPainter {
  final List<int> data;
  final List<int> comparingIndices;
  final fillPaint = Paint()
    ..color = Colors.deepPurpleAccent
    ..style = PaintingStyle.fill;

  final strokePaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final colorsList = <Color>[Colors.yellow, Colors.cyan, Colors.amber];

  ColumnGraphPainter(this.data, this.comparingIndices);

  @override
  void paint(Canvas canvas, Size size) {
    final elementWidth = size.width / data.length;
    final maxElementHeight =
        data.isNotEmpty ? data.reduce((a, b) => a > b ? a : b).toDouble() : 1.0;

    final colors = colorsList.toList();

    for (int i = 0; i < data.length; i++) {
      final elementHeight = data[i].toDouble() / maxElementHeight * size.height;
      final rect = Rect.fromPoints(
        Offset(i * elementWidth, size.height),
        Offset((i + 1) * elementWidth, size.height - elementHeight),
      );

      if (comparingIndices.contains(i)) {
        canvas.drawRect(rect, fillPaint..color = colors.removeLast());
      } else {
        canvas.drawRect(rect, fillPaint..color = Colors.deepPurpleAccent);
      }

      // drawing rect twice for fill and visible border
      canvas.drawRect(rect, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant ColumnGraphPainter oldDelegate) {
    return true;
  }
}
