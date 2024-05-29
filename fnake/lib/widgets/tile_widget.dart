import 'package:flutter/material.dart';

import 'package:fnake/models/tile_model.dart';

class TileWidget extends StatelessWidget {
  final TileModel tile;

  const TileWidget({super.key, required this.tile});

  Color getTileColor() {
    if (tile.isSnakeHead) {
      return Colors.green;
    } else if (tile.isSnake) {
      return Colors.lightGreen;
    } else if (tile.isFood) {
      return Colors.red;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        color: getTileColor(),
      ),
    );
  }
}