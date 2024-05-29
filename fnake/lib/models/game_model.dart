// Flutter base packages
import 'package:flutter/material.dart';

// Fnake packages
import 'package:fnake/models/board_model.dart';
import 'package:fnake/models/snake_model.dart';
import 'package:fnake/models/food_model.dart';

// Fnake enums
import 'package:fnake/enums/direction_enum.dart';

@immutable
class GameModel {
  const GameModel({
    required this.board,
    this.snake,
    required this.direction,
    required this.food,
    required this.score,
  });

  final BoardModel board;
  final SnakeModel? snake;
  final Direction direction;
  final FoodModel food;
  final int score;

  SnakeModel get getSnake => snake!;
}

