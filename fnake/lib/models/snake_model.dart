import 'package:fnake/models/tile_model.dart';
import 'package:fnake/enums/direction_enum.dart';

class SnakeModel {
  const SnakeModel({
    required this.tiles,
});
  final List<TileModel> tiles;
  final Direction direction = Direction.right;

}