import 'package:fnake/models/tile_model.dart';
import 'package:fnake/enums/direction_enum.dart';

class SnakeModel {
  const SnakeModel({
    required this.tiles,
});
  final List<TileModel> tiles;
  final Direction direction = Direction.up;

  void changeDirection(Direction newDirection) {
    if (direction == Direction.up && newDirection == Direction.down) {
      return;
    } else if (direction == Direction.down && newDirection == Direction.up) {
      return;
    } else if (direction == Direction.left && newDirection == Direction.right) {
      return;
    } else if (direction == Direction.right && newDirection == Direction.left) {
      return;
    }
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

  void move() {
    int xOffset = _getXOffset();
    int yOffset = _getYOffset();
    final newTiles = <TileModel>[];
    for(int i = tiles.length - 1; i > 0; i--) {
      tiles[i] = TileModel(
        posX: tiles[i].getX() + xOffset,
        posY: tiles[i].getY() + yOffset,
        width: tiles[i].width,
        height: tiles[i].height,
      );
    }
    tiles.clear();
    tiles.addAll(newTiles);
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