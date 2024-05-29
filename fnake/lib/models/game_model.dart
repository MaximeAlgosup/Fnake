// Fnake packages
import 'package:fnake/models/board_model.dart';
import 'package:fnake/models/snake_model.dart';
import 'package:fnake/models/food_model.dart';

// Fnake enums
import 'package:fnake/enums/direction_enum.dart';
import 'package:fnake/models/tile_model.dart';

class GameModel {
  GameModel({
    required this.board,
    this.snake,
    required this.direction,
    required this.food,
    required this.score,
    required this.isStarted,
  });

  final BoardModel board;
  SnakeModel? snake;
  final Direction direction;
  final FoodModel food;
  int score;
  bool isStarted = false;

  SnakeModel get getSnake => snake!;

  GameModel copyWith({
    BoardModel? board,
    SnakeModel? snake,
    Direction? direction,
    FoodModel? food,
    int? score,
    bool? isStarted,
  }) {
    return GameModel(
      board: board ?? this.board,
      snake: snake ?? this.snake,
      direction: direction ?? this.direction,
      food: food ?? this.food,
      score: score ?? this.score,
      isStarted: isStarted ?? this.isStarted,
    );
  }

  void restartGame() {
    snake = SnakeModel(tiles: [
      board.getTile(5, 5),
      board.getTile(5, 6),
      board.getTile(5, 7),
    ]);
    food.setPositon(0, 0);
    board.getTile(food.getX(), food.getY()).setFood(true);
    boardUpdate();
    isStarted = false;
  }

  void clearBoard() {
    for(int i = 0; i < board.nbColumns; i++) {
      for(int j = 0; j < board.nbRows; j++) {
        board.tileList[i][j].setSnake(false);
        board.tileList[i][j].setSnakeHead(false);
        board.tileList[i][j].setFood(false);
      }
    }
  }

  void boardUpdate() {
    for(int i = 0; i < board.nbColumns; i++) {
      for(int j = 0; j < board.nbRows; j++) {
        board.tileList[i][j].setSnake(false);
        board.tileList[i][j].setSnakeHead(false);
        board.tileList[i][j].setFood(false);
      }
    }
    for (TileModel tile in snake!.tiles) {
      board.getTile(tile.getX(), tile.getY()).setSnake(true);
    }
    TileModel head = snake!.getHead();
    board.getTile(head.getX(), head.getY()).setSnakeHead(true);
    board.getTile(food.getX(), food.getY()).setFood(true);
    // Check if snake eats food
    if (head.getX() == food.getX() && head.getY() == food.getY()) {
      snake!.grow();
      board.getTile(food.getX(), food.getY()).setFood(false);
      food.generateNewPosition();
      board.getTile(food.getX(), food.getY()).setFood(true);
      // Increase score
      score += food.value;
    }
  }
}

