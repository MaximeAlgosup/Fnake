// Flutter base packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Fnake packages
import 'package:fnake/models/game_model.dart';
import 'package:fnake/models/board_model.dart';
import 'package:fnake/models/snake_model.dart';
import 'package:fnake/models/food_model.dart';

// Fnake enums
import 'package:fnake/enums/direction_enum.dart';
import 'package:fnake/models/tile_model.dart';

class GameNotifier extends StateNotifier<GameModel> {
  GameNotifier()
      : super(
      GameModel(
        board: BoardModel(nbRows: 10, nbColumns: 10),
        direction: Direction.up,
        snake: SnakeModel(tiles: [
          TileModel(posX: 5, posY: 5, width: 20, height: 20)
        ]),
        food: FoodModel(value: 10),
        score: 0,
        isStarted: false,
      )
  );

  void startGame() {
    state = GameModel(
      board: BoardModel(nbRows: 10, nbColumns: 10),
      direction: Direction.up,
      snake: SnakeModel(tiles: [
        state.board.getTile(5, 5),
        state.board.getTile(5, 6),
        state.board.getTile(5, 7),
      ]),
      food: FoodModel(value: 10),
      score: 0,
      isStarted: true,
    );
    state.boardUpdate();

    state.board.getTile(0, 0).setFood(true);
  }

  void stopGame() {
    state.clearBoard();
    state = state.copyWith(
      isStarted: false,
    );
  }

  void moveSnake() {
    if (!state.isStarted) {
      return;
    }
    bool res = state.snake!.move();
    if (!res) {
      debugPrint('Game Over');
      state.restartGame();
      state.clearBoard();
    }
    else {
      state.boardUpdate();
    }
    state = state.copyWith(
    );
  }

  void changeDirection(Direction newDirection) {
    state.snake!.changeDirection(newDirection);
  }
}

final gameNotifier = StateNotifierProvider<GameNotifier, GameModel>((ref) {
  return GameNotifier();
});