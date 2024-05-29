import 'package:flutter/material.dart';
import 'package:fnake/models/tile_model.dart';
import 'package:fnake/enums/direction_enum.dart';

class SnakeModel {
  List<TileModel> tiles;
  Direction direction = Direction.up;

  SnakeModel({
    required this.tiles,
});


  void changeDirection(Direction newDirection) {
    direction = newDirection;
  }

  int _getXOffset() {
    if (direction == Direction.left) {
      return -1;
    } else if (direction == Direction.right) {
      return 1;
    } else {
      return 0;
    }
  }

  int _getYOffset() {
    if (direction == Direction.up) {
      return -1;
    } else if (direction == Direction.down) {
      return 1;
    } else {
      return 0;
    }
  }

  void addTile(TileModel tile) {
    tiles.add(tile);
  }

  TileModel getHead() {
    debugPrint('Snake size: ${tiles.length}');
    return tiles[0];
  }

  bool move() {
    int xOffset = _getXOffset();
    int yOffset = _getYOffset();
    List<TileModel> newTiles = [];
    for(int i = 0; i < tiles.length; i++) {
      TileModel tile = tiles[i];
      // Check if the snake is out of bounds
      if (tile.getX() + xOffset < 0 || tile.getX() + xOffset >= 10 || tile.getY() + yOffset < 0 || tile.getY() + yOffset >= 10) {
        debugPrint('Snake out of bounds');
        return false;
      }

      if (i == 0) {
        newTiles.add(TileModel(
          posX: tile.getX() + xOffset,
          posY: tile.getY() + yOffset,
          width: tile.width,
          height: tile.height,
        ));
      } else {
        TileModel previousTile = tiles[i - 1];
        newTiles.add(TileModel(
          posX: previousTile.getX(),
          posY: previousTile.getY(),
          width: tile.width,
          height: tile.height,
        ));
      }
    }
    // check if the snake eats itself
    for (int i = 1; i < newTiles.length; i++) {
      if (newTiles[i].getX() == newTiles[0].getX() && newTiles[i].getY() == newTiles[0].getY()) {
        debugPrint('Snake eats itself');
        return false;
      }
    }
    tiles.clear();
    tiles.addAll(newTiles);
    return true;
  }

  void grow() {
    final lastTile = tiles.last;
    tiles.add(TileModel(
      posX: lastTile.getX() + _getXOffset(),
      posY: lastTile.getY() + _getYOffset(),
      width: lastTile.width,
      height: lastTile.height,
    ));
  }

}