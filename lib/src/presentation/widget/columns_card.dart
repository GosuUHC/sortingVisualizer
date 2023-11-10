import 'package:flutter/material.dart';

import 'column_painter.dart';

class ColumnsCard extends StatelessWidget {
  const ColumnsCard({super.key});

  @override
  Widget build(BuildContext context) {
    print("columns card rebuild");

    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                child: ColumnPainter(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
