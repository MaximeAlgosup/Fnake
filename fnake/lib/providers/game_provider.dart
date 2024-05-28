// Flutter base packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Fnake packages
import 'package:fnake/models/game_model.dart';
import 'package:fnake/models/board_model.dart';
import 'package:fnake/models/snake_model.dart';
import 'package:fnake/models/food_model.dart';

class GameNotifier extends StateNotifier<GameModel> {
  GameNotifier()
      : super(
      GameModel(
        board: BoardModel(nbRows: 10, nbColumns: 10),
        food: const FoodModel(posX: 0, posY: 0, value: 10),
        score: 0,
      )
  );

  void startGame() {
    state = GameModel(
      board: BoardModel(nbRows: 10, nbColumns: 10),
      snake: SnakeModel(tiles: [
        state.board.getTile(5, 5),
        state.board.getTile(5, 6),
        state.board.getTile(5, 7),
      ]),
      food: const FoodModel(posX: 0, posY: 0, value: 10),
      score: 0,
    );
  }
}

final gameNotifier = StateNotifierProvider<GameNotifier, GameModel>((ref) {
  return GameNotifier();
});