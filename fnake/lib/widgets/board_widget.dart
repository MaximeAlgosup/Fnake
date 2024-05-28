import 'package:flutter/material.dart';

import 'package:fnake/models/board_model.dart';

import 'package:fnake/widgets/tile_widget.dart';

class BoardWidget extends StatelessWidget {
  final BoardModel board;

  const BoardWidget({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: board.nbColumns,
      ),
      itemBuilder: (context, index) {
        return TileWidget(
          tile: board.tileList[index % board.nbColumns][index ~/ board.nbColumns],
        );
      },
      itemCount: board.nbRows * board.nbColumns,
    );
  }
}