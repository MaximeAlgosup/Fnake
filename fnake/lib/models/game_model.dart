// Flutter base packages
import 'package:flutter/material.dart';

// Fnake packages
import 'package:fnake/models/board_model.dart';
import 'package:fnake/models/snake_model.dart';
import 'package:fnake/models/food_model.dart';

@immutable
class GameModel {
  const GameModel({
    required this.board,
    this.snake,
    required this.food,
    required this.score,
  });

  final BoardModel board;
  final SnakeModel? snake;
  final FoodModel food;
  final int score;
}

